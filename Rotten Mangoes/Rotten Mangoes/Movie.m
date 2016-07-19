//
//  Movie.m
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-18.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithMovieTitle:(NSString *)title year:(NSNumber *)year runtime:(NSNumber *)runtime poster:(UIImage *)poster synopsis:(NSString *)synopsis andCriticsRating:(NSString *)criticsRating
{
    self = [super init];
    if (self) {
        _movieTitle = title;
        _movieYear = year;
        _movieRunTime = runtime;
        _moviePoster = poster;
        _synopsis = synopsis;
        _criticsRating = criticsRating;
    }
    return self;
}

@end
