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

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "CLLocation+APTimeZones.h"
#import "CLPlacemark+APTimeZones.h"

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
