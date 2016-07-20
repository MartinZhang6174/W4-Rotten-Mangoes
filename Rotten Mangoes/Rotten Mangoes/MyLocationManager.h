//
//  MyLocationManager.h
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-19.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
@import UIKit;

@protocol MovieCollectionViewDelegate <NSObject>

- (void)newLocationDetected:(CLLocation *)location;

@end

@interface MyLocationManager : NSObject

@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *currentLocation;
@property (nonatomic, weak) id<MovieCollectionViewDelegate> delegate;

+ (id) sharedManager;
- (void) startLocationMonitoring;

@end
