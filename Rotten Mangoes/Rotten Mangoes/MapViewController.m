//
//  MapViewController.m
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-19.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "MapViewController.h"
#import "AppDelegate.h"
#import "MyLocationManager.h"
@import MapKit;
#define zoominMapArea 2100

@interface MapViewController () <MKMapViewDelegate, MovieCollectionViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *theatreDirectionMapKitView;
@property (nonatomic) MyLocationManager *locationManager;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initiateMap];
    [self.theatreDirectionMapKitView setShowsUserLocation:YES];
}

- (void) initiateMap {
    self.locationManager = [MyLocationManager sharedManager];
    [self.locationManager startLocationMonitoring];
    self.locationManager.delegate = self;
}

-(void)newLocationDetected:(CLLocation *)location{
    CLLocationCoordinate2D zoomLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
    
    MKCoordinateRegion adjustedRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, zoominMapArea, zoominMapArea);
    
    [self.theatreDirectionMapKitView setRegion:adjustedRegion animated:YES];
    
//    [FoursquareManager responseFrom4sq:location categoryId:@"4d4b7105d754a06377d81259" limit:@"20" block:^(NSArray *locationsArray, NSError *error) {
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.mapView addAnnotations:locationsArray];
//        });
//        
//    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
