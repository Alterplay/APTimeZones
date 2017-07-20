An utility for iOS and OSX developers to simplify extracting NSTimeZone from a given CLLocation. 

You can do the same job by calling [Google API](https://developers.google.com/maps/documentation/timezone/) or [Yahoo API](http://help.yahoo.com/l/us/yahoo/ewsapt/webservices/reference/overview/wsr_timezones.html) but APTimeZones works locally, offline and with no limits inherented to hosted solutions.

### Usage:

```objc
//Ukraine location
CLLocation *location = [[CLLocation alloc] initWithLatitude:50.449846
                                                  longitude:30.523629];
                                                      
NSTimeZone *timeZone = [[APTimeZones sharedInstance] timeZoneWithLocation:location];
NSLog(@"%@", timeZone);
```

You can use APTimeZones with CLGeocoder as well to receive NSTimeZone for a given city string.  

```objc
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
```

### Version 1.1:
We've added some handy categories with version 1.1 to make timezones magic even more easy.

CLLocation+APTimeZones
CLPlacemark+APTimeZones

```objc
    CLLocation *location = ...
    NSLog(@"%@", location.timeZone);

    CLPlacemark *placemark = ...;
    NSLog(@"%@", placemark.timeZone);
```

Also, we've added example project that shows APTimeZones usage [<a href="http://www.youtube.com/watch?v=JwB_E9xCAKg">Demo Video on YouTube</a>]:

<table border-width=0><tr>
<td><img src="https://raw.github.com/Krivoblotsky/APTimeZones/master/Resources/screenshowMap.png" width=320 style="width: 320px;"/></td>
<td><img src="https://raw.github.com/Krivoblotsky/APTimeZones/master/Resources/screenshotGeoCoder.png" width=320 style="width: 320px;"/></td>
</tr></table>

#### APTimeZones requires ARC.

=======================

[Check out](https://github.com/Alterplay) all Alterplay's GitHub projects.
[Email us](mailto:hello@alterplay.com?subject=From%20GitHub%20APTimeZones) with other ideas and projects.
