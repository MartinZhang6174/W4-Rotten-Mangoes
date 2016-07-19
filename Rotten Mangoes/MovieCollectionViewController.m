//
//  MovieCollectionViewController.m
//  Rotten Mangoes
//
//  Created by Martin Zhang on 2016-07-18.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "MovieCollectionViewController.h"
#import "Movie.h"
#import "MovieCell.h"

@interface MovieCollectionViewController ()

//@property NSMutableArray *movies;
@property NSMutableArray *movieArray;

@end

@implementation MovieCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Defining URLString:
    NSString *urlString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=j9fhnct2tp8wu2q9h75kanh9&page_limit=50";
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSData *data = [NSData dataWithContentsOfURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError* error) {
        if (!error) {
            
            NSError *jsonError = nil;
            NSDictionary *movies = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError][@"movies"];
            self.movieArray = [[NSMutableArray alloc] init];
            
            
            
            for (NSDictionary *eachMovie in movies) {
                
                NSString *title = eachMovie[@"title"];
                
                
                NSNumber *year = eachMovie[@"year"];
                NSNumber *runtime = eachMovie[@"runtime"];
                NSString *rating = eachMovie[@"critics_rating"];
                NSString *imageString = eachMovie[@"posters"][@"original"];
//                 Converting imageString into an URL then an UIImage:
                NSURL *imageURL = [NSURL URLWithString:imageString];
                NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                UIImage *image = [[UIImage alloc] initWithData:imageData];
                
                Movie *aMovie = [[Movie alloc] initWithMovieTitle:title year:year runtime:runtime poster:image andCriticsRating:rating];
                NSLog(@"A movie's name is :%@.", aMovie.movieTitle);
//                 Add each movie into an NSMutableDictionary:
                [self.movieArray addObject:aMovie];
            }

        }
    }];
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.movieArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
