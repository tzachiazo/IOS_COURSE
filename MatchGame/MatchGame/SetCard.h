//
//  SetCard.h
//  MatchGame
//
//  Created by Tzachi Azo on 16/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "Card.h"
#import <UIKit/UIKit.h>

@interface SetCard : Card


@property (nonatomic) NSInteger shapeID;
@property (nonatomic) NSInteger colorId;
@property (nonatomic) NSInteger numberOfShapesInCard;


@property (nonatomic) NSInteger maxObjects;



@end
