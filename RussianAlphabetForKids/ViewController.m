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

@property (assign, nonatomic) BOOL detailViewScrolling;

@property (strong, nonatomic) NSArray *letters;
@property (strong, nonatomic) Letter *selectedLetter;

- (void)setupNavigationCollectionViewBackground;

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.letters = [Letter allAlphabetLetters];
        self.selectedLetter = self.letters[0];
        self.detailViewScrolling = NO;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.trackedViewName = [NSString stringWithFormat:@"Letter View Controller. Current letter: %@", self.selectedLetter];
    
    [self setupNavigationCollectionViewBackground];
    
    self.detailCollectionView.allowsMultipleSelection = NO;
    self.navigationCollectionView.allowsMultipleSelection = NO;
    
    self.detailCollectionView.layer.shadowColor = [[UIColor colorWithRed:55/255.0 green:215/255.0 blue:232/255.0 alpha:1] CGColor];
    self.detailCollectionView.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.detailCollectionView.layer.shadowRadius = 1.0f;
    self.detailCollectionView.layer.shadowOpacity = 1.0f;
    self.detailCollectionView.layer.masksToBounds = NO;
    
    [self.selectedLetter playSound];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.trackedViewName = [NSString stringWithFormat:@"Letter View Controller. Current letter: %@", self.selectedLetter];
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
        if (letter == self.selectedLetter) {
            cell.selected = YES;
        } else {
            cell.selected = NO;
        }
    }
    
    return cell;
}

#pragma mark - CollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LetterDetailCollectionViewCell *cell = (LetterDetailCollectionViewCell *)[self.detailCollectionView cellForItemAtIndexPath:indexPath];
    self.selectedLetter = cell.letter;
    [self.selectedLetter playSound];
    
    if (collectionView == self.navigationCollectionView) {
        
        for (NavigationLetterCollectionViewCell *navCell in self.navigationCollectionView.visibleCells) {
            navCell.selected = NO;
        }
        
        [self.detailCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.detailViewScrolling = YES;
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.selectedLetter stopSound];
    self.selectedLetter = nil;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (collectionView == self.detailCollectionView && !self.detailViewScrolling) {
        
        NavigationLetterCollectionViewCell *oldNavCell = (NavigationLetterCollectionViewCell *)[self.navigationCollectionView cellForItemAtIndexPath:indexPath];
        oldNavCell.selected = NO;
        
        if (self.detailCollectionView.visibleCells.count > 0) {
            
            [self.selectedLetter stopSound];
            
            LetterDetailCollectionViewCell *detailCell = self.detailCollectionView.visibleCells[0];
            
            self.selectedLetter = detailCell.letter;
            [self.selectedLetter playSound];
            
            NSIndexPath *newIndexPath = [self.detailCollectionView indexPathForCell:detailCell];
            [self.navigationCollectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
            NavigationLetterCollectionViewCell *navCell = (NavigationLetterCollectionViewCell *)[self.navigationCollectionView cellForItemAtIndexPath:newIndexPath];
            navCell.selected = YES;
        }
    }

}

#pragma mark - ScrollView Delegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (scrollView == self.detailCollectionView) {
        self.detailViewScrolling = NO;
    }
}

@end
