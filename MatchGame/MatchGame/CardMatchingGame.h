//
//  CardMatchingGame.h
//  MatchGame
//
//  Created by Tzachi Azo on 11/10/15.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount: (NSUInteger)count usingDeck:(Deck *) deck;

- (void) chooseCardAtIndex: (NSInteger)index;
- (Card *) cardAtIndex: (NSUInteger)index;

@property (nonatomic, readonly ) NSString * status;
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic ) NSInteger numOfCards;



@end
