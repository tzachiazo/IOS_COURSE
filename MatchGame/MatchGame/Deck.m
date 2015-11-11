//
//  Deck.m
//  MatchGame
//
//  Created by Tzachi Azo on 11/9/15.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong , nonatomic) NSMutableArray *cards;

@end

@implementation Deck





-(NSMutableArray * )cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}


- (void)addCard:(Card *)card atTop:(BOOL)atToop
{
    if(atToop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

-(void) addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard
{
    Card * randomCard;
    
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}


@end
