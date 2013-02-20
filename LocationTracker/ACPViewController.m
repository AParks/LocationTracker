//
//  ACPViewController.m
//  LocationTracker
//
//  Created by Anna Parks on 2/16/13.
//  Copyright (c) 2013 Anna Parks. All rights reserved.
//

#import "ACPViewController.h"
#import "ACPAppDelegate.h"


@interface ACPViewController ()
@property (strong, nonatomic) ACPAppDelegate *myAppDelegate;

@end

@implementation ACPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CLLocationCoordinate2D userLocation = CLLocationCoordinate2DMake(37.325488,-122.032242);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation, 2000, 2000);
    [self.mapView setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
   [self.mapView setCenterCoordinate:location.coordinate animated:YES];
    [self addPinToMapAtLocation:location];
}

- (void)addPinToMapAtLocation:(CLLocation *)location
{
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = location.coordinate;
    pin.title = @"foo";
    pin.subtitle = @"bar";
    [self.mapView addAnnotation:pin];
}

@end
