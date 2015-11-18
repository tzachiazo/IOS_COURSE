//
//  CardsGame.h
//  MatchGame
//
//  Created by Tzachi Azo on 16/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardsGame : NSObject


- (instancetype) initWithCardCount: (NSUInteger)count usingDeck:(Deck *) deck;

- (void) chooseCardAtIndex: (NSInteger)index;
- (Card *) cardAtIndex: (NSUInteger)index;
- (NSString *)cardArrayToString:(NSMutableArray *)cardArray;

@property (nonatomic , strong) NSMutableArray *cards;
@property (nonatomic, readwrite ) NSString * status;
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic ) NSInteger numOfCards;

@end
