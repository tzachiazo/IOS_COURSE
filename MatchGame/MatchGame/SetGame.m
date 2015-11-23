//
//  SetGame.m
//  MatchGame
//
//  Created by Tzachi Azo on 17/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "SetGame.h"

@implementation SetGame


static const int MISMATCH_PENALTY = 4;
//static const int MISMATCH_PENALTY = 4;


- (void) chooseCardAtIndex:(NSInteger)index
{
    self.status = @"";
    NSMutableArray * openCards;
    openCards = [[NSMutableArray alloc] init];
    
    Card * card = [self cardAtIndex:index];
    
    
    if(card.chosen){
        card.chosen = NO;
        self.status = [@"unchoosed Card: " stringByAppendingString:card.contents];
    }else{
        self.status = [@"Choosed Card: " stringByAppendingString:card.contents];
        for(Card *otherCard in self.cards){
            if(otherCard.chosen == YES)
            {// && otherCard.isMatched == NO){
                [openCards addObject:otherCard];
            }
        }
        
        if(openCards.count == 2){
            int matchScore = [card match:openCards];
            
      
            if(matchScore){
                self.status = [@"It's a Match, Extra points: " stringByAppendingString:[NSString stringWithFormat:@"%d" ,(matchScore * 4)]];
                self.score += matchScore * 8;
                
                card.matched = YES;
                for(Card * otherCard in openCards){
                    otherCard.matched = YES;
                }
                
                
               
            }else{
                self.status = @"No Match!!!";
                self.status = [self.status stringByAppendingString:@" Are Not Matched!" ];
                self.score -= MISMATCH_PENALTY;
    
            }
            
            for(Card * curCard in openCards){
                curCard.chosen = NO;
            }
            card.chosen = NO;
        }
        
        self.score -= 1;
        card.chosen = YES;
    }
    
}

-(void)add3Cards
{
    if([self.cards count] < 12)
    {
        for(int i = 0 ; i < 3 ; i ++)
        {
             [self.cards addObject:[self.deck drawRandomCard]];
        }
       
    }
    
}

-(void)removeCards:(NSArray *)others
{
    
    for(Card* cur in others)
    {
        
        [self.cards removeObject:cur];
    }
    
}

@end
