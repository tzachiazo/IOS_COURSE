//
//  PlayingCard.h
//  MatchGame
//
//  Created by Tzachi Azo on 11/9/15.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong , nonatomic) NSString * suit;
@property (nonatomic) NSInteger rank;

+ (NSArray *)rankStrings;
+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;
@end
