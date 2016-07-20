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
    self.movieTitle.text = movie.movieTitle;
    self.movieYear.text = [movie.movieYear stringValue];
    self.movieRatings.text = movie.criticsRating;
    
    // stop the old download task.
    [self.task cancel];
    
    // use the url to get the image.
    //     self.moviePoster.image = movie.moviePoster;
    self.moviePoster.image = nil;

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *dataTask = [session dataTaskWithURL:movie.moviePosterURL completionHandler:^(NSData *data, NSURLResponse *response, NSError* error) {
        if (!error) {
            
            UIImage *image = [UIImage imageWithData:data];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.moviePoster.image = image;
            });
        }
    
    }];
    [dataTask resume];

    
    // save this task so it can be cancelled later.
    self.task = dataTask;
    
}

@end
