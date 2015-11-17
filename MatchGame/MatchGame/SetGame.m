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
    
    
    if(card.isChosen){
        card.chosen = NO;
        self.status = [@"Flip back card: " stringByAppendingString:card.contents];
    }else{
        
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
                self.score += matchScore * 4;
               
            }else{
                self.status = @"No Match!!!";
                self.status = [self.status stringByAppendingString:@" Are Not Matche!" ];
                self.score -= MISMATCH_PENALTY;
                
                //return;
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

@end
