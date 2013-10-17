TimeZonesDB
===========

Great drop-in offline tool to get NSTimeZone from CLLocation.
Requires ARC.

Usage:

            //Ukraine location
            CLLocation *location = [[CLLocation alloc] initWithLatitude:50.449846
                                                              longitude:30.523629];
                                                              
            NSTimeZone *timeZone = [[TimeZonesDB sharedInstance] timeZoneWithLocation:location];
            NSLog(@"%@", timeZone);
Output:

Europe/Kiev (GMT+03:00) offset 10800 (Daylight)
