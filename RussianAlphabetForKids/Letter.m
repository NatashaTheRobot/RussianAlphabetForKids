//
//  Letter.m
//  RussianAlphabetForKids
//
//  Created by Natasha Murashev on 6/21/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "Letter.h"

@implementation Letter

+ (NSArray *)allAlphabetLetters
{
    Letter *letter0 = [[Letter alloc] init];
    letter0.letter = @"А";
    letter0.smallLetter = @"а";
    letter0.imageName = @"watermelon.png";
    letter0.word = @"Арбузик";
    
    Letter *letter1 = [[Letter alloc] init];
    letter1.letter = @"Б";
    letter1.smallLetter = @"б";
    letter1.imageName = @"butterfly.png";
    letter1.word = @"Бабочка";
    
    Letter *letter2 = [[Letter alloc] init];
    letter2.letter = @"В";
    letter2.smallLetter = @"в";
    letter2.imageName = @"waves.png";
    letter2.word = @"Волны";
    
    Letter *letter3 = [[Letter alloc] init];
    letter3.letter = @"Г";
    letter3.smallLetter = @"г";
    letter3.imageName = @"mushroom.png";
    letter3.word = @"Грибочек";
    
    Letter *letter4 = [[Letter alloc] init];
    letter4.letter = @"Д";
    letter4.smallLetter = @"д";
    letter4.imageName = @"house.png";
    letter4.word = @"Домик";
    
    Letter *letter5 = [[Letter alloc] init];
    letter5.letter = @"Е";
    letter5.smallLetter = @"е";
    letter5.imageName = @"elmtree.png";
    letter5.word = @"Ель";
    
    Letter *letter6 = [[Letter alloc] init];
    letter6.letter = @"Ё";
    letter6.smallLetter = @"ё";
    letter6.imageName = @"porcupine.png";
    letter6.word = @"Ёжик";
    
    Letter *letter7 = [[Letter alloc] init];
    letter7.letter = @"Ж";
    letter7.smallLetter = @"ж";
    letter7.imageName = @"bug.png";
    letter7.word = @"Жучок";
    
    Letter *letter8 = [[Letter alloc] init];
    letter8.letter = @"З";
    letter8.smallLetter = @"з";
    letter8.imageName = @"star.png";
    letter8.word = @"Звёздочка";
    
    Letter *letter9 = [[Letter alloc] init];
    letter9.letter = @"И";
    letter9.smallLetter = @"и";
    letter9.imageName = @"turkey.png";
    letter9.word = @"Индюк";
    
    Letter *letter10 = [[Letter alloc] init];
    letter10.letter = @"Й";
    letter10.smallLetter = @"й";
    letter10.imageName = @"iodine.png";
    letter10.word = @"Йод";
    
    Letter *letter11 = [[Letter alloc] init];
    letter11.letter = @"К";
    letter11.smallLetter = @"к";
    letter11.imageName = @"cat.png";
    letter11.word = @"Котик";
    
    Letter *letter12 = [[Letter alloc] init];
    letter12.letter = @"Л";
    letter12.smallLetter = @"л";
    letter12.imageName = @"boat.png";
    letter12.word = @"Лодочка";
    
    Letter *letter13 = [[Letter alloc] init];
    letter13.letter = @"М";
    letter13.smallLetter = @"м";
    letter13.imageName = @"bear.png";
    letter13.word = @"Мишка";
    
    Letter *letter14 = [[Letter alloc] init];
    letter14.letter = @"Н";
    letter14.smallLetter = @"н";
    letter14.imageName = @"notes.png";
    letter14.word = @"Нотки";
    
    Letter *letter15 = [[Letter alloc] init];
    letter15.letter = @"О";
    letter15.smallLetter = @"о";
    letter15.imageName = @"dendelion.png";
    letter15.word = @"Одуваньчик";
    
    Letter *letter16 = [[Letter alloc] init];
    letter16.letter = @"П";
    letter16.smallLetter = @"п";
    letter16.imageName = @"pig.png";
    letter16.word = @"Поросёнок";
    
    Letter *letter17 = [[Letter alloc] init];
    letter17.letter = @"Р";
    letter17.smallLetter = @"р";
    letter17.imageName = @"fish.png";
    letter17.word = @"Рыбка";
    
    Letter *letter18 = [[Letter alloc] init];
    letter18.letter = @"С";
    letter18.smallLetter = @"с";
    letter18.imageName = @"sun.png";
    letter18.word = @"Солнышко";
    
    Letter *letter19 = [[Letter alloc] init];
    letter19.letter = @"Т";
    letter19.smallLetter = @"т";
    letter19.imageName = @"cake.png";
    letter19.word = @"Тортик";
    
    Letter *letter20 = [[Letter alloc] init];
    letter20.letter = @"У";
    letter20.smallLetter = @"у";
    letter20.imageName = @"duck.png";
    letter20.word = @"Утка";
    
    Letter *letter21 = [[Letter alloc] init];
    letter21.letter = @"Ф";
    letter21.smallLetter = @"ф";
    letter21.imageName = @"owl.png";
    letter21.word = @"Филин";
    
    Letter *letter22 = [[Letter alloc] init];
    letter22.letter = @"Х";
    letter22.smallLetter = @"х";
    letter22.imageName = @"bread.png";
    letter22.word = @"Хлебушек";
    
    Letter *letter23 = [[Letter alloc] init];
    letter23.letter = @"Ц";
    letter23.smallLetter = @"ц";
    letter23.imageName = @"chicks.png";
    letter23.word = @"Цыплёнки";
    
    Letter *letter24 = [[Letter alloc] init];
    letter24.letter = @"Ч";
    letter24.smallLetter = @"ч";
    letter24.imageName = @"cheburashka.png";
    letter24.word = @"Чебурашка";
    
    Letter *letter25 = [[Letter alloc] init];
    letter25.letter = @"Ш";
    letter25.smallLetter = @"ш";
    letter25.imageName = @"baloons.png";
    letter25.word = @"Шарики";
    
    Letter *letter26 = [[Letter alloc] init];
    letter26.letter = @"Щ";
    letter26.smallLetter = @"щ";
    letter26.imageName = @"puppy.png";
    letter26.word = @"Щенок";
    
    Letter *letter27 = [[Letter alloc] init];
    letter27.letter = @"Ъ";
    letter27.smallLetter = @"ъ";
    letter27.imageName = @"detour.png";
    letter27.word = @"обЪезд";
    
    Letter *letter28 = [[Letter alloc] init];
    letter28.letter = @"Ы";
    letter28.smallLetter = @"ы";
    letter28.imageName = @"mouse.png";
    letter28.word = @"мЫшка";
    
    Letter *letter29 = [[Letter alloc] init];
    letter29.letter = @"Ь";
    letter29.smallLetter = @"ь";
    letter29.imageName = @"six.png";
    letter29.word = @"шестЬ";
    
    Letter *letter30 = [[Letter alloc] init];
    letter30.letter = @"Э";
    letter30.smallLetter = @"э";
    letter30.imageName = @"elf.png";
    letter30.word = @"Элф";
    
    Letter *letter31 = [[Letter alloc] init];
    letter31.letter = @"Ю";
    letter31.smallLetter = @"ю";
    letter31.imageName = @"spinner.png";
    letter31.word = @"Юла";
    
    Letter *letter32 = [[Letter alloc] init];
    letter32.letter = @"Я";
    letter32.smallLetter = @"я";
    letter32.imageName = @"apple.png";
    letter32.word = @"Яблочко";
    
    return @[letter0, letter1, letter2, letter3, letter4, letter5,
             letter6, letter7, letter8, letter9, letter10, letter11,
             letter12, letter13, letter14, letter15, letter16, letter17,
             letter18, letter19, letter20, letter21, letter22, letter23,
             letter24, letter25, letter26, letter27, letter28, letter29,
             letter30, letter31, letter32];
}

@end
