//
//  Theatre.m
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-19.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "Theatre.h"

@implementation Theatre

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)aCoordinate andTitle:(NSString * _Nullable)aTitle andSubtitle:(NSString * _Nullable)aSubtitle
{
    self = [super init];
    if (self) {
        _coordinate = aCoordinate;
        _title = aTitle;
        _subtitle = aSubtitle;
    }
    return self;
}

@end
