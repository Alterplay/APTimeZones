//
//  CLPlacemark+APTimeZones.h
//  Example
//
//  Created by Sergii Kryvoblotskyi on 11/11/13.
//  Copyright (c) 2013 Alterplay. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLPlacemark (APTimeZones)
- (NSTimeZone *)timeZone;
@end
