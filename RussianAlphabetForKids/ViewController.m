//
//  ViewController.m
//  RussianAlphabetForKids
//
//  Created by Natasha Murashev on 6/21/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "ViewController.h"
#import "Letter.h"
#import <QuartzCore/QuartzCore.h>
#import "LetterDetailCollectionViewCell.h"
#import "NavigationLetterCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *navigationCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *detailCollectionView;

@property (strong, nonatomic) NSArray *letters;

- (void)setupNavigationCollectionViewBackground;

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.letters = [Letter allAlphabetLetters];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavigationCollectionViewBackground];
    
    self.detailCollectionView.allowsMultipleSelection = NO;
    self.navigationCollectionView.allowsMultipleSelection = NO;
    
    self.view.layer.cornerRadius = 7;
    self.view.layer.masksToBounds = YES;
    
}

- (void)setupNavigationCollectionViewBackground
{
    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.width)];
    [backgroundView addSubview:backgroundImageView];
    
    self.navigationCollectionView.backgroundView = backgroundView;
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

# pragma mark - CollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.letters.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"letter";
    UICollectionViewCell *cell;
    
    Letter *letter = self.letters[indexPath.row];
    
    if (collectionView == self.detailCollectionView) {
        cell = [self.detailCollectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        ((LetterDetailCollectionViewCell *)cell).letter = letter;
    } else {
        cell = [self.navigationCollectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        ((NavigationLetterCollectionViewCell *)cell).letter = letter;
    }
    
    return cell;
}

#pragma mark - CollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.navigationCollectionView) {
        [self.navigationCollectionView.visibleCells enumerateObjectsUsingBlock:^(NavigationLetterCollectionViewCell *cell, NSUInteger idx, BOOL *stop) {
            cell.selected = NO;
        }];
        
        LetterDetailCollectionViewCell *cell = (LetterDetailCollectionViewCell *)[self.detailCollectionView cellForItemAtIndexPath:indexPath];
        cell.selected = YES;
        
        [self.detailCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}

#pragma mark - Scroll View Delegate

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.detailCollectionView) {
        [self.detailCollectionView.visibleCells enumerateObjectsUsingBlock:^(LetterDetailCollectionViewCell *cell, NSUInteger idx, BOOL *stop) {
            cell.selected = NO;
        }];
        
        [self.navigationCollectionView.visibleCells enumerateObjectsUsingBlock:^(NavigationLetterCollectionViewCell *cell, NSUInteger idx, BOOL *stop) {
            cell.selected = NO;
        }];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.detailCollectionView) {
        LetterDetailCollectionViewCell *letterDetailCell = self.detailCollectionView.visibleCells[0];
        
        NSIndexPath *indexPath = [self.detailCollectionView indexPathForCell:letterDetailCell];
        
        NavigationLetterCollectionViewCell *navigationCell = (NavigationLetterCollectionViewCell *)[self.navigationCollectionView cellForItemAtIndexPath:indexPath];
        navigationCell.selected = YES;
        
        [self.navigationCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        [letterDetailCell.letter playSound];
    }
}

@end
