//
//  GeoCoderViewController.m
//  Example
//
//  Created by Sergii Kryvoblotskyi on 11/11/13.
//  Copyright (c) 2013 Alterplay. All rights reserved.
//

#import "GeoCoderViewController.h"
#import "APTimeZones.h"

@implementation GeoCoderViewController

#pragma mark - UIText Field Delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    //Start geocoding
    [self geocodeCityZoneWithText:textField.text];
    return YES;
}

- (void)geocodeCityZoneWithText:(NSString *)text {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:text completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count) {
            CLPlacemark *placemark = placemarks[0];
            _textView.text = placemark.timeZone.description;
        } 
    }];
    
}

@end
