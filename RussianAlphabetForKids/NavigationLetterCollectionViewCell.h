//
//  NavigationLetterCollectionViewCell.h
//  RussianAlphabetForKids
//
//  Created by Natasha Murashev on 6/24/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Letter.h"

@interface NavigationLetterCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) Letter *letter;

- (void)clearSelection;

@end
