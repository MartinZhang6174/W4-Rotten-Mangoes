//
//  MovieCell.m
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-18.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

-(void)configureWithMovie:(Movie *)movie {
    self.moviePoster.image = movie.moviePoster;
    self.movieTitle.text = movie.movieTitle;
    self.movieYear.text = [movie.movieYear stringValue];
}

@end
