//
//  MovieCollectionViewController.m
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-18.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "MovieCollectionViewController.h"
#import "ReviewViewController.h"
#import "Movie.h"
#import "MovieCell.h"

@interface MovieCollectionViewController ()

@property NSMutableArray *movieArray;

@end

@implementation MovieCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const segueToDetailViewController = @"segueToDetailViewController";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movieArray = [[NSMutableArray alloc] init];

    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    
    // Defining URLString:
    NSString *urlString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=j9fhnct2tp8wu2q9h75kanh9&page_limit=50";
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSData *data = [NSData dataWithContentsOfURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError* error) {
        if (!error) {
            
            NSError *jsonError = nil;
            NSDictionary *movies = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError][@"movies"];
            
            
            
            for (NSDictionary *eachMovie in movies) {
                
                NSString *title = eachMovie[@"title"];
                NSNumber *year = eachMovie[@"year"];
                NSNumber *runtime = eachMovie[@"runtime"];
                NSString *rating = eachMovie[@"ratings"][@"critics_rating"];
                NSString *imageString = eachMovie[@"posters"][@"original"];
                NSString *synopsis = eachMovie[@"synopsis"];
//                 Converting imageString into an URL then an UIImage:
                NSURL *imageURL = [NSURL URLWithString:imageString];
                //NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                //UIImage *image = nil;
                //[[UIImage alloc] initWithData:imageData];
                
                Movie *aMovie = [[Movie alloc] initWithMovieTitle:title year:year runtime:runtime poster:imageURL synopsis:synopsis andCriticsRating:rating];
//                NSLog(@"A movie's name is %@, it was released in %@ and has a rating of %@!", aMovie.movieTitle, aMovie.movieYear, aMovie.criticsRating);
//                 Add each movie into an NSMutableDictionary:
                [self.movieArray addObject:aMovie];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });

        }
    }];
    [dataTask resume];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (![segue.identifier isEqualToString:segueToDetailViewController]) {
        return;
    }
    
    ReviewViewController *destinationViewController = [segue destinationViewController];
    Movie *movieForReview = self.movieArray[self.collectionView.indexPathsForSelectedItems.firstObject.row];
    destinationViewController.movieForReviewing = movieForReview;
}


#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.movieArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *aMovieCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSLog(@"congiguring %@", indexPath);
    
    // Configure the cell
    Movie *aMovieInCell = self.movieArray[indexPath.row];
    [aMovieCell configureWithMovie:aMovieInCell];
    
    return aMovieCell;
    
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
