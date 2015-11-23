//
//  SetCardView.h
//  MatchGame
//
//  Created by Tzachi Azo on 19/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "CardView.h"

@interface SetCardView : CardView <UIDynamicItem>


@property (nonatomic) NSInteger shapeNumber;
@property (nonatomic) NSInteger numShapesInCard;
@property (nonatomic) UIColor * color;


/*
@property (readonly) CGRect bounds;
@property (readwrite) CGPoint center;
@property (readwrite) CGAffineTransform transform;
*/


@end
