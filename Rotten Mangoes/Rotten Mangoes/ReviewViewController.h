//
//  ReviewViewController.h
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-18.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *movieCriticsRatingLabel;
@property (strong, nonatomic) IBOutlet UILabel *movieRunTimeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *largeMoviePosterImageView;

@end
