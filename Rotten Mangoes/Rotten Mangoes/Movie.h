//
//  Movie.h
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-18.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *movieTitle;
@property (nonatomic, strong) NSNumber *movieYear;
@property (nonatomic, strong) NSNumber *movieRunTime;
@property (nonatomic, strong) NSString *criticsRating;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) UIImage *moviePoster;

- (instancetype)initWithMovieTitle:(NSString *)title year:(NSNumber *)year runtime:(NSNumber *)runtime poster:(UIImage *)poster synopsis:(NSString *)synopsis andCriticsRating:(NSString *)criticsRating;

@end
