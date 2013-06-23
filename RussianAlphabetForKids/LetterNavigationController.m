//
//  LetterNavigationController.m
//  RussianAlphabetForKids
//
//  Created by Natasha Murashev on 6/23/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "LetterNavigationController.h"
#import "Letter.h"
#import "ViewController.h"

@interface LetterNavigationController ()

@end

@implementation LetterNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _allLetterViewControllers = [NSMutableArray arrayWithCapacity:33];
    
    [[Letter allAlphabetLetters] enumerateObjectsUsingBlock:^(Letter *letter, NSUInteger idx, BOOL *stop) {
        ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([ViewController class])];
        viewController.letterIndex = idx;
        [_allLetterViewControllers addObject:viewController];
    }];
    
    [self.navigationController pushViewController:self.allLetterViewControllers[0] animated:NO];
}

@end
