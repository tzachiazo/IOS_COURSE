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

@property (nonatomic) NSString * cardValue;

@property (nonatomic) UIColor * color;
//@property (nonatomic) UIColor * shading;
//@property (nonatomic) NSInteger * number;
//@property (nonatomic) NSString * shape;

//@property (nonatomic) NSInteger* rank;

@property (nonatomic) NSInteger * maxObjects;


+ (NSArray *) validColors;
+ (NSArray *) validShapes;


@end
