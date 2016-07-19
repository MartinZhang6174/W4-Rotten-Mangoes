//
//  MovieCell.h
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-18.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *moviePoster;
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;
@property (strong, nonatomic) IBOutlet UILabel *movieYear;
@property (strong, nonatomic) IBOutlet UILabel *movieRatings;

-(void)configureWithMovie:(Movie *)movie;

@end
