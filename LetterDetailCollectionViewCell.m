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

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
- (void)setupAudio;

//- (IBAction)playSoundWithTapGesture:(id)sender;

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
    [self setupAudio];
}

- (void)setupAudio
{
    NSError *error;
    self.audioPlayer =[[AVAudioPlayer alloc] initWithContentsOfURL:[self.letter soundFileURL] error:&error];
    self.audioPlayer.delegate = self;
}

//- (IBAction)playSoundWithTapGesture:(id)sender
//{
//    [self.audioPlayer play];
//}

// play sound when view appears
//if (self.audioPlayer.isPlaying) {
//    [self.audioPlayer stop];
//}

@end
