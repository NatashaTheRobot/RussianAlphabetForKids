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

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = [[UIColor colorWithRed:105/255.0 green:62/255.0 blue:255/255.0 alpha:1] CGColor];
    } else {
        self.layer.borderWidth = 0;
        self.layer.borderColor = [[UIColor clearColor] CGColor];
    }
}

@end
