//
//  CardView.h
//  MatchGame
//
//  Created by Tzachi Azo on 18/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView


@property (nonatomic) NSUInteger rank;
@property (nonatomic) NSString* suit;
@property (nonatomic) BOOL isChoosen;

@property (nonatomic) bool faceUp;





@end
