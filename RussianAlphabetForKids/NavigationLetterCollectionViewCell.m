//
//  NavigationLetterCollectionViewCell.m
//  RussianAlphabetForKids
//
//  Created by Natasha Murashev on 6/24/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "NavigationLetterCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface NavigationLetterCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation NavigationLetterCollectionViewCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.layer.cornerRadius = 7;
        self.layer.masksToBounds = YES;
    }
    
    return self;
}

- (void)setLetter:(Letter *)letter
{
    _letter = letter;
    self.imageView.image = [letter image];
}

@end
