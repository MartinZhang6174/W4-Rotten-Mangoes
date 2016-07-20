//
//  ReviewViewController.h
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-18.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
@import MapKit;

@interface ReviewViewController : UIViewController

@property (nonatomic) Movie *movieForReviewing;
@property (strong, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *movieCriticsRatingLabel;
@property (strong, nonatomic) IBOutlet UILabel *movieRunTimeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *largeMoviePosterImageView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *findLocationButton;
@property (nonatomic) NSURLSessionTask *task;

//-(void)configureReviewWithTitle:(NSString *)title criticsRating:(NSString *)rating runtime:(NSNumber *)runtime andMoviePoster:(UIImage *)poster;
- (void)configureReviewViewControllerWith:(Movie *)movieToBeReviewed;

@end
