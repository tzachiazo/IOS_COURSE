//
//  SetDeck.m
//  MatchGame
//
//  Created by Tzachi Azo on 17/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"

@implementation SetDeck


- (instancetype)init
{
    
    if(self = [super init])
    {
        
        for(NSString * shape in [SetCard validShapes])
        {
            for( UIColor * color in [SetCard validColors])
            {
                for(int i = 1 ; i <= 3 ; i++){
                    SetCard * card = [[SetCard alloc] init];
                    card.cardValue = @"";
                    card.color = color;
                    for(int j = 1 ; j <= i ; j++){
                        card.cardValue =  [card.cardValue stringByAppendingString:shape];
                    }
                    ////////
                    
                    
                    
                    
                    
                    
                    
                    
                    //////////
                    
                    [self addCard:card];
                }
              
            }
        }
        
        
    }
    
    return self;
    
}

@end
