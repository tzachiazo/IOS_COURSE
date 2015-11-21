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
        
        //loop for 3 shapes!
        for(int shape = 0 ; shape < 3 ; shape++)
        {
            //loops for 3 colors
            for(int color = 0 ; color < 3 ; color++)
            {
                //loops for 3 numbers
                for(int num = 1 ; num <= 3 ; num++)
                {
                    SetCard * card = [[SetCard alloc] init];
                    card.shapeID = shape;
                    card.colorId = color;
                    card.numberOfShapesInCard = num;
                    
                    [self addCard:card];
                }
              
            }
        }
    }
    
    return self;
    
}

@end
