//
//  ViewController.m
//  RussianAlphabetForKids
//
//  Created by Natasha Murashev on 6/21/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "ViewController.h"
#import "Letter.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *playSoundWithButton;

- (void)setupLetter;

- (void)addGestureBackRecognizer;
- (void)gestureBack:(id)sender;

- (void)addGestureForwardRecognizer;
- (void)gestureForward:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBar.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.hidesBackButton = YES;
    
    [self setupLetter];
    
    [self addGestureForwardRecognizer];
    [self addGestureBackRecognizer];
    
}

- (void)setupLetter
{
    self.view.tag = self.letterIndex;
    Letter *letter = [Letter allAlphabetLetters][self.view.tag];
    self.wordLabel.text = letter.word;
    self.imageView.image = [UIImage imageNamed:letter.imageName];
    self.navigationItem.title = [NSString stringWithFormat:@"%@ %@", letter.letter, letter.smallLetter];
}

- (void)addGestureBackRecognizer
{
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureBack:)];
    
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    
    [self.view addGestureRecognizer:recognizer];
}

- (void)gestureBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addGestureForwardRecognizer
{
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureForward:)];
    
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    
    [self.view addGestureRecognizer:recognizer];
}

- (void)gestureForward:(id)sender
{
    if (self.letterIndex == 32) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([ViewController class])];
        viewController.letterIndex = self.letterIndex + 1;
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
