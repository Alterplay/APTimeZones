<img src="https://dl.dropboxusercontent.com/u/2334198/APTimeZones-git-teaser.png">

An utility for iOS and OSX developers to simplify extracting NSTimeZone from a given CLLocation. 

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

###Version 1.1:
We've added some handy categories with version 1.1 to make timezones magic even more easy.

CLLocation+APTimeZones

CLPlacemark+APTimeZones

Usage:

    CLLocation *location = ...
    NSLog(@"%@", location.timeZone);

    CLPlacemark *placemark = ...;
    NSLog(@"%@", placemark.timeZone);

Also, we've added example project that shows APTimeZones usage [<a href="http://www.youtube.com/watch?v=JwB_E9xCAKg">Demo Video on YouTube</a>]:

<table border-width=0><tr>
<td><img width=320 src="https://dl.dropboxusercontent.com/u/11819370/APTimeZones/screenshowMap.png"></td>
<td><img width=320 src="https://dl.dropboxusercontent.com/u/11819370/APTimeZones/screenshotGeoCoder.png"></td>
</tr></table>

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/37d1f4beb3d0ef7b866eec21b27ecc5f "githalytics.com")](http://githalytics.com/Alterplay/APTimeZones)
If you have improvements or concerns, feel free to post [an issue](https://github.com/Alterplay/APTimeZones/issues) and write details.

=======================
*[Check out](https://github.com/Alterplay) all Alterplay's GitHub projects.*
*[Email us](mailto:hello@alterplay.com?subject=From%20GitHub%20APTimeZones) with other ideas and projects.*
