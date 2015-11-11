//
//  PlayingCardDeck.m
//  MatchGame
//
//  Created by Tzachi Azo on 11/9/15.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck


- (instancetype)init
{
    
    if(self = [super init])
    {
        for( NSString * suit in [PlayingCard validSuits])
        {
            for(NSInteger rank = 1 ; rank <= [PlayingCard maxRank] ; rank++)
            {    
                PlayingCard * card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
        
    }
    
    return self;
    
}

@end
