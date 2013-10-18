APTimeZones
===========

APTimeZones library. Great offline iOS tool to extract NSTimeZone from a given CLLocation. 

Usage:

    //Ukraine location
    CLLocation *location = [[CLLocation alloc] initWithLatitude:50.449846
                                                      longitude:30.523629];
                                                      
    NSTimeZone *timeZone = [[APTimeZones sharedInstance] timeZoneWithLocation:location];
    NSLog(@"%@", timeZone);


You can use APTimeZones with Apple CLGeocoder as well to receive NSTimeZone for a given city string.  

    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:@"New York" completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count) {
            CLPlacemark *placemark = placemarks[0];
            CLLocation *location = placemark.location;
            
            NSString *countryCode = placemark.addressDictionary[@"CountryCode"];
            NSTimeZone *timeZone = [[APTimeZones sharedInstance] timeZoneWithLocation:location
                                                                          countryCode:countryCode];
            completion(timeZone);
        } else {
            completion([NSTimeZone systemTimeZone]);
        }
    }];


