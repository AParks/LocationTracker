//
//  ACPViewController.h
//  LocationTracker
//
//  Created by Anna Parks on 2/16/13.
//  Copyright (c) 2013 Anna Parks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@class ACPAppDelegate;


@interface ACPViewController : UIViewController 

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;



@end
