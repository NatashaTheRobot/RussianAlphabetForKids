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
@property (strong, nonatomic) Letter *selectedLetter;

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
    self.selectedLetter = self.letters[indexPath.row];
    
    if (collectionView == self.detailCollectionView) {
        [self.selectedLetter playSound];
    } else {
        // add border
        [self.detailCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.detailCollectionView) {
        Letter *letter = self.letters[indexPath.row];
        [letter stopSound];
    } else {
        NavigationLetterCollectionViewCell *cell = (NavigationLetterCollectionViewCell *)[self.navigationCollectionView cellForItemAtIndexPath:indexPath];
        [cell clearSelection];
    }
}


// set selected letter on collection view
// scroll to the selected cell
// can't insert item beyond bounds! when poping on new view

@end
