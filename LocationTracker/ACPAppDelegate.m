//
//  ACPAppDelegate.m
//  LocationTracker
//
//  Created by Anna Parks on 2/16/13.
//  Copyright (c) 2013 Anna Parks. All rights reserved.
//

#import "ACPAppDelegate.h"
#import "ACPViewController.h"


@implementation ACPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self start_normal_location_change_updates];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of //
    [self.locationManager stopMonitoringSignificantLocationChanges];
    self.locationManager.delegate = nil;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   
    
    if (![CLLocationManager locationServicesEnabled]){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Announcement"
                              message: @"You have location services disabled. Go to Settings > Privacy > Location to enable it."
                              delegate: self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    [self start_normal_location_change_updates];


}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void) start_normal_location_change_updates
{
    if (!self.locationManager)
        self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    self.locationManager.distanceFilter = 1000;
    [self.locationManager startMonitoringSignificantLocationChanges];

}



// CLLocation Management Delegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    ACPViewController* mainController = (ACPViewController*)  self.window.rootViewController;
    [mainController locationManager:manager didUpdateLocations:locations];

}



@end
