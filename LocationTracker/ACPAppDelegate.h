//
//  ACPAppDelegate.h
//  LocationTracker
//
//  Created by Anna Parks on 2/16/13.
//  Copyright (c) 2013 Anna Parks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@class ACPViewController;

@interface ACPAppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end
