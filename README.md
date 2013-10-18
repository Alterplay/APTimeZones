APTimeZones
===========

An utility for iOS/OSX developers to simplify extracting NSTimeZone from a given CLLocation. 

You can do the same job by calling [Google API](https://developers.google.com/maps/documentation/timezone/) or [Yahoo API](http://help.yahoo.com/l/us/yahoo/ewsapt/webservices/reference/overview/wsr_timezones.html) but APTimeZones works locally, offline and with no limits inherented to hosted solutions.

###Usage:

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
            NSLog(@"%@", timeZone);
        } 
    }];


