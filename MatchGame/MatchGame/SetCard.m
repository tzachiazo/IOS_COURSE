//
//  SetCard.m
//  MatchGame
//
//  Created by Tzachi Azo on 16/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (NSString *) contents
{
    NSString * str = [NSString stringWithString:self.cardValue];
      
    return str;
}


+ (NSArray *) validShapes
{
    return @[@"△" , @"❒" , @"❍"];
}

+ (NSArray *) validColors
{
    return @[ [UIColor redColor ] , [UIColor greenColor] , [UIColor blueColor]];
}

-(int)match:(NSArray *)otherCards
{
    bool Matched = false;
    if(otherCards.count != 2){
        return 0;
    }
    //compare colors
    if(
        (self.color == (((SetCard*)otherCards[0])).color) &&
        (self.color == (((SetCard*)otherCards[1])).color) &&
       ((((SetCard*)otherCards[0])).color==(((SetCard*)otherCards[1])).color)
    ){
        Matched = true;
    }
    
    
    if(
       (self.color != (((SetCard*)otherCards[0])).color) &&
       (self.color != (((SetCard*)otherCards[1])).color) &&
       ((((SetCard*)otherCards[0])).color!=(((SetCard*)otherCards[1])).color)
       ){
        Matched = true;
    }
    
    //compare content
    NSString * shpae1 = [self.cardValue substringWithRange:NSMakeRange(0, 1)];
    
    NSString * shpae2 = [(((SetCard*)otherCards[0])).cardValue substringWithRange:NSMakeRange(0, 1)];
    
    NSString * shpae3 = [(((SetCard*)otherCards[1])).cardValue substringWithRange:NSMakeRange(0, 1)];
    
    bool contantMatch = false;
    if( [shpae1 isEqualToString: shpae2 ] &&
        [shpae1 isEqualToString: shpae3 ]  &&
        [shpae2 isEqualToString: shpae3 ]
       ){
        contantMatch = true;
    }
    if(![shpae1 isEqualToString: shpae2 ] &&
       ![shpae1 isEqualToString: shpae3 ]  &&
       ![shpae2 isEqualToString: shpae3 ]
       ){
        contantMatch = true;
    }
    Matched &= contantMatch;
    
    //compare size
    NSUInteger len1 = [self.cardValue length];
    
    NSUInteger len2 = [(((SetCard*)otherCards[0])).cardValue length];
    
    NSUInteger len3 = [(((SetCard*)otherCards[1])).cardValue length];

    
    bool lenMatch = false;
    if( len1 == len2 &&
        len1 == len3 &&
        len2 == len3
       ){
        lenMatch = true;
    }
    if(len1 != len2 &&
       len1 != len3 &&
       len2 != len3
       ){
        lenMatch = true;
    }
    Matched &= lenMatch;
    
    return (Matched)? 1: 0;
}


@end
