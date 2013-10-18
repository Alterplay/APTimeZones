//
//  TimeZonesDB.h
//  TimeZonesDB
//
//  Created by Sergii Kryvoblotskyi on 10/17/13.
//  Copyright (c) 2013 Sergii Kryvoblotskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface APTimeZones : NSObject

/*
 Get timezone with lat/lon and country code
 */
- (NSTimeZone *)timeZoneWithLocation:(CLLocation *)location;

/*
 Get timezone with lat/lon and country code.
 Extremely speeds up and more carefull result.
 */
- (NSTimeZone *)timeZoneWithLocation:(CLLocation *)location countryCode:(NSString *)countryCode;

+ (APTimeZones *)sharedInstance;
@end
