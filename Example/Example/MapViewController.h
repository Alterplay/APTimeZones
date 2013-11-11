//
//  MapViewController.h
//  Example
//
//  Created by Sergii Kryvoblotskyi on 11/11/13.
//  Copyright (c) 2013 Alterplay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *timeZoneLabel;
@end
