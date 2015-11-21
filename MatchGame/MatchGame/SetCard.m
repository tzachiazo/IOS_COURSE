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
    NSString * str = @" ";
      
    return str;
}



-(int)match:(NSArray *)otherCards
{
    bool Matched = false;
    if(otherCards.count != 2){
        return 0;
    }
    //compare colors
    if(
        (self.colorId == (((SetCard*)otherCards[0])).colorId) &&
        (self.colorId == (((SetCard*)otherCards[1])).colorId) &&
       ((((SetCard*)otherCards[0])).colorId==(((SetCard*)otherCards[1])).colorId)
    ){
        Matched = true;
    }
    
    
    if(
       (self.colorId != (((SetCard*)otherCards[0])).colorId) &&
       (self.colorId != (((SetCard*)otherCards[1])).colorId) &&
       ((((SetCard*)otherCards[0])).colorId!=(((SetCard*)otherCards[1])).colorId)
       ){
        Matched = true;
    }
    
    //compare shape
    
    bool contantMatch = false;
    if(
       (self.shapeID == (((SetCard*)otherCards[0])).shapeID) &&
       (self.shapeID == (((SetCard*)otherCards[1])).shapeID) &&
       ((((SetCard*)otherCards[0])).shapeID==(((SetCard*)otherCards[1])).shapeID)
       ){
        contantMatch = true;
    }
    if(
       (self.shapeID != (((SetCard*)otherCards[0])).shapeID) &&
       (self.shapeID != (((SetCard*)otherCards[1])).shapeID) &&
       ((((SetCard*)otherCards[0])).shapeID!=(((SetCard*)otherCards[1])).shapeID)
       ){
        contantMatch = true;
    }
    Matched &= contantMatch;
    
    //compare number of shapes
    
    bool lenMatch = false;
    if(
       (self.numberOfShapesInCard == (((SetCard*)otherCards[0])).numberOfShapesInCard) &&
       (self.numberOfShapesInCard == (((SetCard*)otherCards[1])).numberOfShapesInCard) &&
       ((((SetCard*)otherCards[0])).numberOfShapesInCard==(((SetCard*)otherCards[1])).numberOfShapesInCard)
       ){
        lenMatch = true;
    }
    if(
       (self.numberOfShapesInCard != (((SetCard*)otherCards[0])).numberOfShapesInCard) &&
       (self.numberOfShapesInCard != (((SetCard*)otherCards[1])).numberOfShapesInCard) &&
       ((((SetCard*)otherCards[0])).numberOfShapesInCard!=(((SetCard*)otherCards[1])).numberOfShapesInCard)
       ){
        lenMatch = true;
    }
    
    Matched &= lenMatch;
    
    
    
    return (Matched)? 1: 0;
}


@end
