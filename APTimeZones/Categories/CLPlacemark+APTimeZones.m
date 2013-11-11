//
//  CLPlacemark+APTimeZones.m
//  Example
//
//  Created by Sergii Kryvoblotskyi on 11/11/13.
//  Copyright (c) 2013 Alterplay. All rights reserved.
//

#import "CLPlacemark+APTimeZones.h"
#import "APTimeZones.h"

@implementation CLPlacemark (APTimeZones)

- (NSTimeZone *)timeZone {
    CLLocation *location = self.location;
    
    NSString *countryCode = self.addressDictionary[@"CountryCode"];
    NSTimeZone *timeZone = [[APTimeZones sharedInstance] timeZoneWithLocation:location
                                                                  countryCode:countryCode];
    return timeZone;
}

@end
