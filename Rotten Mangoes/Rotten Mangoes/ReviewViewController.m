//
//  ReviewViewController.m
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-18.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "ReviewViewController.h"

@interface ReviewViewController ()

@end

@implementation ReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self configureReviewViewControllerWith:self.movieForReviewing];

}



- (void)configureReviewViewControllerWith:(Movie *)movieToBeReviewed {
    self.movieTitleLabel.text = self.movieForReviewing.movieTitle;
    self.movieCriticsRatingLabel.text = self.movieForReviewing.criticsRating;
    self.movieRunTimeLabel.text = [self.movieForReviewing.movieRunTime stringValue];
//    NSString *imageString = [self.movieForReviewing.moviePosterURL absoluteString];
//    NSData *imageData = [imageString dataUsingEncoding:NSUTF8StringEncoding];
//    self.largeMoviePosterImageView.image = [UIImage imageWithData:imageData];
    
    // stop the old download task.
    [self.task cancel];
    
    // use the url to get the image.
    //     self.moviePoster.image = movie.moviePoster;
    self.largeMoviePosterImageView.image = nil;
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *dataTask = [session dataTaskWithURL:self.movieForReviewing.moviePosterURL completionHandler:^(NSData *data, NSURLResponse *response, NSError* error) {
        if (!error) {
            
            UIImage *image = [UIImage imageWithData:data];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.largeMoviePosterImageView.image = image;
            });
        }
        
    }];
    [dataTask resume];
    
    
    // save this task so it can be cancelled later.
    self.task = dataTask;
    
}

- (IBAction)findingTheatresButtonPressed:(id)sender {
    
}

@end
