//
//  LetterDetailCollectionViewCell.m
//  RussianAlphabetForKids
//
//  Created by Natasha Murashev on 6/24/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "LetterDetailCollectionViewCell.h"
#import <AVFoundation/AVFoundation.h>

@interface LetterDetailCollectionViewCell () <AVAudioPlayerDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;

@end

@implementation LetterDetailCollectionViewCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
    }
    
    return self;
}

- (void)setLetter:(Letter *)letter
{
    _letter = letter;
    self.imageView.image = [letter image];
    self.wordLabel.text = letter.word;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (!selected) {
        [self.letter stopSound];
    }
}


@end
