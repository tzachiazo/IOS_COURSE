//
//  Card.m
//  MatchGame
//
//  Created by Tzachi Azo on 11/9/15.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for(Card * card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
        
    }
    
    return score;
}

@end
