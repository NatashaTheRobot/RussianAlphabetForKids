//
//  Letter.h
//  RussianAlphabetForKids
//
//  Created by Natasha Murashev on 6/21/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Letter : NSObject

@property (strong, nonatomic) NSString *letter;
@property (strong, nonatomic) NSString *smallLetter;
@property (strong, nonatomic) NSString *word;
@property (strong, nonatomic) NSString *imageName;

+ (NSArray *)allAlphabetLetters;

@end
