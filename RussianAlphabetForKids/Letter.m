//
//  Letter.m
//  RussianAlphabetForKids
//
//  Created by Natasha Murashev on 6/21/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "Letter.h"
#import <AVFoundation/AVFoundation.h>

@interface Letter () <AVAudioPlayerDelegate>

@property (strong, nonatomic) NSString *fileName;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end


@implementation Letter

- (id)init
{
    self = [super init];
    
    if (self) {
        [self setupAudio];
    }
    
    return self;
}

- (void)setFileName:(NSString *)fileName
{
    _fileName = fileName;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self setupAudio];
    });
    
}

- (void)setupAudio
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:self.fileName ofType:@"mp4"];
    NSURL *soundFileURL  = [NSURL fileURLWithPath:filePath];
    
    NSError *error;
    self.audioPlayer =[[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
    self.audioPlayer.delegate = self;
    [self.audioPlayer prepareToPlay];
}

- (void)playSound
{
    [self.audioPlayer play];
}

- (void)stopSound
{
    if ([self.audioPlayer isPlaying]) {
        [self.audioPlayer stop];
    }
}

- (UIImage *)image
{
    NSString *imageName = [NSString stringWithFormat:@"%@.png", self.fileName];
    return [UIImage imageNamed:imageName];
}

+ (NSArray *)allAlphabetLetters
{
    Letter *letter0 = [[Letter alloc] init];
    letter0.letter = @"А";
    letter0.smallLetter = @"а";
    letter0.fileName = @"watermelon";
    letter0.word = @"Арбузик";
    
    Letter *letter1 = [[Letter alloc] init];
    letter1.letter = @"Б";
    letter1.smallLetter = @"б";
    letter1.fileName = @"butterfly";
    letter1.word = @"Бабочка";
    
    Letter *letter2 = [[Letter alloc] init];
    letter2.letter = @"В";
    letter2.smallLetter = @"в";
    letter2.fileName = @"waves";
    letter2.word = @"Водичка";
    
    Letter *letter3 = [[Letter alloc] init];
    letter3.letter = @"Г";
    letter3.smallLetter = @"г";
    letter3.fileName = @"mushroom";
    letter3.word = @"Грибочек";
    
    Letter *letter4 = [[Letter alloc] init];
    letter4.letter = @"Д";
    letter4.smallLetter = @"д";
    letter4.fileName = @"house";
    letter4.word = @"Домик";
    
    Letter *letter5 = [[Letter alloc] init];
    letter5.letter = @"Е";
    letter5.smallLetter = @"е";
    letter5.fileName = @"elmtree";
    letter5.word = @"Ель";
    
    Letter *letter6 = [[Letter alloc] init];
    letter6.letter = @"Ё";
    letter6.smallLetter = @"ё";
    letter6.fileName = @"porcupine";
    letter6.word = @"Ёжик";
    
    Letter *letter7 = [[Letter alloc] init];
    letter7.letter = @"Ж";
    letter7.smallLetter = @"ж";
    letter7.fileName = @"bug";
    letter7.word = @"Жучок";
    
    Letter *letter8 = [[Letter alloc] init];
    letter8.letter = @"З";
    letter8.smallLetter = @"з";
    letter8.fileName = @"star";
    letter8.word = @"Звёздочка";
    
    Letter *letter9 = [[Letter alloc] init];
    letter9.letter = @"И";
    letter9.smallLetter = @"и";
    letter9.fileName = @"turkey";
    letter9.word = @"Индюк";
    
    Letter *letter10 = [[Letter alloc] init];
    letter10.letter = @"Й";
    letter10.smallLetter = @"й";
    letter10.fileName = @"iodine";
    letter10.word = @"Йод";
    
    Letter *letter11 = [[Letter alloc] init];
    letter11.letter = @"К";
    letter11.smallLetter = @"к";
    letter11.fileName = @"cat";
    letter11.word = @"Котик";
    
    Letter *letter12 = [[Letter alloc] init];
    letter12.letter = @"Л";
    letter12.smallLetter = @"л";
    letter12.fileName = @"boat";
    letter12.word = @"Лодочка";
    
    Letter *letter13 = [[Letter alloc] init];
    letter13.letter = @"М";
    letter13.smallLetter = @"м";
    letter13.fileName = @"bear";
    letter13.word = @"Мишка";
    
    Letter *letter14 = [[Letter alloc] init];
    letter14.letter = @"Н";
    letter14.smallLetter = @"н";
    letter14.fileName = @"notes";
    letter14.word = @"Нотки";
    
    Letter *letter15 = [[Letter alloc] init];
    letter15.letter = @"О";
    letter15.smallLetter = @"о";
    letter15.fileName = @"dendelion";
    letter15.word = @"Одуваньчик";
    
    Letter *letter16 = [[Letter alloc] init];
    letter16.letter = @"П";
    letter16.smallLetter = @"п";
    letter16.fileName = @"pig";
    letter16.word = @"Поросёнок";
    
    Letter *letter17 = [[Letter alloc] init];
    letter17.letter = @"Р";
    letter17.smallLetter = @"р";
    letter17.fileName = @"fish";
    letter17.word = @"Рыбка";
    
    Letter *letter18 = [[Letter alloc] init];
    letter18.letter = @"С";
    letter18.smallLetter = @"с";
    letter18.fileName = @"sun";
    letter18.word = @"Солнышко";
    
    Letter *letter19 = [[Letter alloc] init];
    letter19.letter = @"Т";
    letter19.smallLetter = @"т";
    letter19.fileName = @"cake";
    letter19.word = @"Тортик";
    
    Letter *letter20 = [[Letter alloc] init];
    letter20.letter = @"У";
    letter20.smallLetter = @"у";
    letter20.fileName = @"duck";
    letter20.word = @"Уточка";
    
    Letter *letter21 = [[Letter alloc] init];
    letter21.letter = @"Ф";
    letter21.smallLetter = @"ф";
    letter21.fileName = @"owl";
    letter21.word = @"Филин";
    
    Letter *letter22 = [[Letter alloc] init];
    letter22.letter = @"Х";
    letter22.smallLetter = @"х";
    letter22.fileName = @"bread";
    letter22.word = @"Хлебушек";
    
    Letter *letter23 = [[Letter alloc] init];
    letter23.letter = @"Ц";
    letter23.smallLetter = @"ц";
    letter23.fileName = @"chicks";
    letter23.word = @"Цыплята";
    
    Letter *letter24 = [[Letter alloc] init];
    letter24.letter = @"Ч";
    letter24.smallLetter = @"ч";
    letter24.fileName = @"cheburashka";
    letter24.word = @"Чебурашка";
    
    Letter *letter25 = [[Letter alloc] init];
    letter25.letter = @"Ш";
    letter25.smallLetter = @"ш";
    letter25.fileName = @"baloons";
    letter25.word = @"Шарики";
    
    Letter *letter26 = [[Letter alloc] init];
    letter26.letter = @"Щ";
    letter26.smallLetter = @"щ";
    letter26.fileName = @"puppy";
    letter26.word = @"Щенок";
    
    Letter *letter27 = [[Letter alloc] init];
    letter27.letter = @"Ъ";
    letter27.smallLetter = @"ъ";
    letter27.fileName = @"detour";
    letter27.word = @"обЪезд";
    
    Letter *letter28 = [[Letter alloc] init];
    letter28.letter = @"Ы";
    letter28.smallLetter = @"ы";
    letter28.fileName = @"mouse";
    letter28.word = @"мЫшка";
    
    Letter *letter29 = [[Letter alloc] init];
    letter29.letter = @"Ь";
    letter29.smallLetter = @"ь";
    letter29.fileName = @"six";
    letter29.word = @"шестЬ";
    
    Letter *letter30 = [[Letter alloc] init];
    letter30.letter = @"Э";
    letter30.smallLetter = @"э";
    letter30.fileName = @"elf";
    letter30.word = @"Эльф";
    
    Letter *letter31 = [[Letter alloc] init];
    letter31.letter = @"Ю";
    letter31.smallLetter = @"ю";
    letter31.fileName = @"spinner";
    letter31.word = @"Юла";
    
    Letter *letter32 = [[Letter alloc] init];
    letter32.letter = @"Я";
    letter32.smallLetter = @"я";
    letter32.fileName = @"apple";
    letter32.word = @"Яблочко";
    
    return @[letter0, letter1, letter2, letter3, letter4, letter5,
             letter6, letter7, letter8, letter9, letter10, letter11,
             letter12, letter13, letter14, letter15, letter16, letter17,
             letter18, letter19, letter20, letter21, letter22, letter23,
             letter24, letter25, letter26, letter27, letter28, letter29,
             letter30, letter31, letter32];
}

@end
