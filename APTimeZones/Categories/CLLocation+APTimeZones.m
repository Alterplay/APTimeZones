//
//  CLLocation+APTimeZones.m
//  Example
//
//  Created by Sergii Kryvoblotskyi on 11/11/13.
//  Copyright (c) 2013 Alterplay. All rights reserved.
//

#import "CLLocation+APTimeZones.h"
#import "APTimeZones.h"

@implementation CLLocation (APTimeZones)

- (NSTimeZone *)timeZone {
    NSTimeZone *timeZone = [[APTimeZones sharedInstance] timeZoneWithLocation:self];
    return timeZone;

}

@end
