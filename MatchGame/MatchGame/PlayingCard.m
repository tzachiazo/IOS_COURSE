//
//  PlayingCard.m
//  MatchGame
//
//  Created by Tzachi Azo on 11/9/15.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *) contents
{
    
    return [ [PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;
- (void) setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : nil;
}

+ (NSArray *) validSuits
{
    return @[@"♣️" , @"♥️" , @"♦️" , @"♠️"];
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", ];
}

+ (NSUInteger ) maxRank
{
    return  [[PlayingCard rankStrings] count] -1;
}


- (void) setRank:(NSInteger) rank
{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
 
}

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    //Check the lats card against the open cards
    for(Card * otherCard in otherCards){
        if(((PlayingCard *)otherCard).rank == self.rank){
            score += 4;
        }else if(((PlayingCard *)otherCard).suit == self.suit){
            score += 1;
        }
    }
    //check Open Cards between them
    for(int i = 0; i < otherCards.count-1 ; i++){
        PlayingCard * firstCard = otherCards[i];
        for(int j = 1 ; j < otherCards.count ; j++){
            PlayingCard * secondCard = otherCards[j];
            if(((PlayingCard *)firstCard).rank == secondCard.rank){
                score += 4;
            }else if(((PlayingCard *)firstCard).suit == secondCard.suit){
                score += 1;
            }
        }
    }
    
    return score;
}



@end
