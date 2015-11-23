//
//  CardsGame.m
//  MatchGame
//
//  Created by Tzachi Azo on 16/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "CardsGame.h"

@implementation CardsGame

- (NSMutableArray * )cards
{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count ) ? self.cards[index] : nil;
}

- (instancetype) initWithCardCount: (NSUInteger)count usingDeck:(Deck *) deck
{
    self = [super init];
    
    if(self){
        for(int i = 0 ; i < count ; i++){
            Card * card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
            
            
        }
    }
    
    self.deck = deck;
    return self;

}

- (void) chooseCardAtIndex: (NSInteger)index
{
    
}

-(NSString *)cardArrayToString:(NSMutableArray *)cardArray
{
    NSString * ans = @"";
    
    for(Card * card in cardArray){
        ans = [[ans stringByAppendingString:[card contents]] stringByAppendingString:@" "] ;
    }
    
    return ans;
}


@end
