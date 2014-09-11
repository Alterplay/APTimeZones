//
//  APTimeZones.h
//  APTimeZones
//
//  Created by Sergii Kryvoblotskyi on 10/17/13.
//  Copyright (c) 2013 Alterplay. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "APTimeZones.h"

@interface APTimeZones ()
@property (nonatomic, strong) NSArray *timeZonesDB;
@end

@implementation APTimeZones

#pragma mark - Public

/*
 Get timezone with lat/lon and country code
 */

- (NSTimeZone *)timeZoneWithLocation:(CLLocation *)location {
    
    NSDictionary *closeseZoneInfo = [self closesZoneInfoWithLocation:location
                                                              source:self.timeZonesDB];
        
    //We've found nothing. Let's use system.
    if (closeseZoneInfo == nil) {
        return [NSTimeZone systemTimeZone];
    }
    
    //Get timezone
    NSTimeZone *timeZone = [self timeZoneWithDictionary:closeseZoneInfo];
    
    //Can't create time zone. Take system.
    if (timeZone == nil) {
        NSAssert(timeZone != nil, @"Can't create timezone: %@", closeseZoneInfo);
        timeZone = [NSTimeZone systemTimeZone];
    }
    
    return timeZone;
}

/*
 Get timezone with lat/lon and country code
 */

- (NSTimeZone *)timeZoneWithLocation:(CLLocation *)location countryCode:(NSString *)countryCode {
        
    //No country
    if (countryCode == nil) {
        return [self timeZoneWithLocation:location];
    }
    
    //Filter
    NSArray *filteredZones = [self filteredTimeZonesWithCountyCode:countryCode];
    
    //Get closest zone info
    NSDictionary *closeseZoneInfo = [self closesZoneInfoWithLocation:location
                                                              source:filteredZones];
    //Get timezone
    NSTimeZone *timeZone = [self timeZoneWithDictionary:closeseZoneInfo];
    
    //If there is no time zone with code. Let's try to find it anyway
    if (timeZone == nil) {
        return [self timeZoneWithLocation:location];
    }
    return timeZone;
}

#pragma mark - Private
- (NSArray *)timeZonesDB {
    if (_timeZonesDB == nil) {
        _timeZonesDB = [self importDataBaseFromFile:@"timezonesDB.json"];
    }
    return _timeZonesDB;
}

/*
 Import from DB
 */
- (NSArray *)importDataBaseFromFile:(NSString *)fileName {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:fileName ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    
    NSAssert(jsonData.length != 0, @"timezonesDB.json not found in app bundle");
    
    NSError *error = nil;
    NSArray *timeZones = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:NSJSONReadingAllowFragments
                                                           error:&error];
    
    NSAssert(error == nil, @"JSON parsing failed");
    return timeZones;
}

/*
 Calculates the closest distance from source
 */
- (NSDictionary *)closesZoneInfoWithLocation:(CLLocation *)location source:(NSArray *)source {
    CLLocationDistance closestDistance = DBL_MAX;
    NSDictionary *closestZoneInfo = nil;
    
    for (NSDictionary *locationInfo in source) {
        
        double latitude = [locationInfo[@"latitude"] doubleValue];
        double longitude = [locationInfo[@"longitude"] doubleValue];
        
        CLLocation *zoneLocation = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
        CLLocationDistance distance = [location distanceFromLocation:zoneLocation];
        if (distance < closestDistance) {
            closestDistance = distance;
            closestZoneInfo = locationInfo;
        }
    }
    return closestZoneInfo;
}

/*
 Filtering the whole DB with the country code
 */

- (NSArray *)filteredTimeZonesWithCountyCode:(NSString *)countryCode {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"country_code LIKE %@", countryCode];
    return [self.timeZonesDB filteredArrayUsingPredicate:predicate];
}

/*
 Timezone from dict
 */
- (NSTimeZone *)timeZoneWithDictionary:(NSDictionary *)zoneInfo {
    NSString *zoneName = zoneInfo[@"zone"];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:zoneName];
    return timeZone;
}

#pragma mark - Singleton
+ (APTimeZones *)sharedInstance {
    static dispatch_once_t pred;
    static APTimeZones *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

@end
