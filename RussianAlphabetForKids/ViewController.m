//
//  ViewController.m
//  RussianAlphabetForKids
//
//  Created by Natasha Murashev on 6/21/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "ViewController.h"
#import "Letter.h"
#import <AVFoundation/AVFoundation.h>
#import "LetterNavigationController.h"

@interface ViewController () <AVAudioPlayerDelegate, UIGestureRecognizerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *letterView;

@property (strong, nonatomic) Letter *letter;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (void)setupLetter;
- (void)setupCollectionViewBackground;

- (void)addGestureBackRecognizer;
- (void)gestureBack:(id)sender;

- (void)addGestureForwardRecognizer;
- (void)gestureForward:(id)sender;

- (IBAction)playSoundWithTapGesture:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupCollectionViewBackground];
    
    self.view.layer.cornerRadius = 7;
    self.view.layer.masksToBounds = YES;
    
    [self setupLetter];
    
    [self addGestureForwardRecognizer];
    [self addGestureBackRecognizer];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    if (self.audioPlayer.isPlaying) {
        [self.audioPlayer stop];
    }

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSError *error;
    self.audioPlayer =[[AVAudioPlayer alloc] initWithContentsOfURL:[self.letter soundFileURL] error:&error];
    self.audioPlayer.delegate = self;
    [self.audioPlayer play];
}

- (void)setupLetter
{
    self.view.tag = self.letterIndex;
    self.letter = [Letter allAlphabetLetters][self.view.tag];
    self.wordLabel.text = self.letter.word;
    self.imageView.image = [self.letter image];
    self.navigationItem.title = [NSString stringWithFormat:@"%@ %@", self.letter.letter, self.letter.smallLetter];
}

- (void)setupCollectionViewBackground
{
    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.width)];
    [backgroundView addSubview:backgroundImageView];
    
    self.collectionView.backgroundView = backgroundView;
}

# pragma mark - Gestures

- (void)showPreviousLetterWithIndex:(NSInteger)index
{
    if (index >= 0) {
        
        LetterNavigationController *navigationController = (LetterNavigationController *)self.navigationController;
        
        if (![navigationController.viewControllers containsObject:navigationController.allLetterViewControllers[index]]) {
            NSMutableArray *viewControllers = [navigationController.viewControllers mutableCopy];
            [viewControllers insertObject:navigationController.allLetterViewControllers[index] atIndex:navigationController.viewControllers.count];
            [navigationController setViewControllers:[NSArray arrayWithArray:viewControllers]];
        }
        
        [navigationController popToViewController:navigationController.viewControllers[(navigationController.viewControllers.count - 1)]
                                         animated:YES];
        
    }
}

- (void)showNextLetterWithIndex:(NSInteger)index
{
    LetterNavigationController *navigationController = (LetterNavigationController *)self.navigationController;
    
    if (self.letterIndex == 32) {
        [navigationController popToViewController:navigationController.viewControllers[0]
                                         animated:YES];
    } else {
        
        if ([navigationController.viewControllers containsObject:navigationController.allLetterViewControllers[index]]) {
            NSMutableArray *viewControllers = [navigationController.viewControllers mutableCopy];
            [viewControllers removeObject:navigationController.allLetterViewControllers[index]];
            [navigationController setViewControllers:[NSArray arrayWithArray:viewControllers]];
        }
        
        [navigationController pushViewController:navigationController.allLetterViewControllers[index]
                                        animated:YES];
    }
}

- (void)addGestureBackRecognizer
{
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureBack:)];
    
    recognizer.delegate = self;
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    
    [self.letterView addGestureRecognizer:recognizer];
}

- (void)gestureBack:(id)sender
{
    [self showPreviousLetterWithIndex:self.letterIndex - 1];

}

- (void)addGestureForwardRecognizer
{
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureForward:)];
    
    recognizer.delegate = self;
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    
    [self.letterView addGestureRecognizer:recognizer];
}

- (void)gestureForward:(id)sender
{
    [self showNextLetterWithIndex:self.letterIndex + 1];
}

- (IBAction)playSoundWithTapGesture:(id)sender
{
    if (!self.audioPlayer.playing) {
        [self.audioPlayer play];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

# pragma mark - CollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[Letter allAlphabetLetters] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"letter" forIndexPath:indexPath];
    
    Letter *letter = [Letter allAlphabetLetters][indexPath.row];
    
    ((UIImageView *)[cell viewWithTag:100]).image = [letter image];
    
    cell.layer.cornerRadius = 7;
    
    return cell;
}

#pragma mark - CollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > self.letterIndex) {
        [self showNextLetterWithIndex:indexPath.row];
    } else {
        [self showPreviousLetterWithIndex:indexPath.row];
    }
}


// set selected letter on collection view
// scroll to the selected cell
// can't insert item beyond bounds! when poping on new view

@end
