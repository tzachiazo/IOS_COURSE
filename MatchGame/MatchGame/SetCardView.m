//
//  SetCardView.m
//  MatchGame
//
//  Created by Tzachi Azo on 19/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "SetCardView.h"

@interface SetCardView()

#define STANDART_HEIGHT 210
#define STANDART_SHAPE_WIDTH 30

#define BASE_SIZE (self.bounds.size.height / [self getShapeRatio])
@end

@implementation SetCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(CGFloat) getShapeRatio{ return STANDART_HEIGHT/STANDART_SHAPE_WIDTH;}


-(void)drawContent
{
    switch (self.shapeNumber) {
        case 0:
            [self drawTriangle ];
            break;
        case 1:
            [self drawRectangle];
            break;
        case 2:
            [self drawCircle ];
            break;
        default:
            break;
    }
   
}

-(void) drawTriangle
{
    //TreAngle
    //cyrcle
    CGContextRef  mainContext = UIGraphicsGetCurrentContext();
    for(int i = 1 ; i <= self.numShapesInCard ; i++){
        CGContextSaveGState(mainContext);
        UIBezierPath *path = [[UIBezierPath alloc] init];
        
        [path moveToPoint:CGPointMake([self getStartingPointX:i]+ (BASE_SIZE/2),[self getStartingPointY:i])];
        [path addLineToPoint:CGPointMake([self getStartingPointX:i],[self getStartingPointY:i] + BASE_SIZE )];
        [path addLineToPoint:CGPointMake([self getStartingPointX:i] + BASE_SIZE ,[self getStartingPointY:i] + BASE_SIZE )];
        [path closePath];
        
        [[UIColor greenColor] setFill];
        [[UIColor blackColor] setStroke];
        
        [path fill];
        [path stroke];
        
        [path addClip];
        CGContextRestoreGState(mainContext);
    }
}

-(void) drawRectangle
{
    CGContextRef  mainContext = UIGraphicsGetCurrentContext();
    for(int i = 1 ; i <= self.numShapesInCard ; i++){
            CGContextSaveGState(mainContext);
        UIBezierPath * myRect = [UIBezierPath bezierPathWithRect:CGRectMake([self getStartingPointX:i], [self getStartingPointY:i], BASE_SIZE, BASE_SIZE) ];
        
        [self.color setFill];
        [self.color setStroke];
        
        [myRect fill];
        [[UIColor blackColor] setStroke];
        
        [myRect addClip];
        CGContextRestoreGState(mainContext);
    }
}

-(void) drawCircle
{
    //cyrcle
    CGContextRef  mainContext = UIGraphicsGetCurrentContext();
    for(int i = 1 ; i <= self.numShapesInCard ; i++){
        CGContextSaveGState(mainContext);
        UIBezierPath *myCyrcle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake([self getStartingPointX:i], [self getStartingPointY:i], BASE_SIZE, BASE_SIZE)];
        [[UIColor greenColor] setFill];
        [[UIColor blackColor] setStroke];
        
        [myCyrcle fill];
        [myCyrcle stroke];
        
        [myCyrcle addClip];
        CGContextRestoreGState(mainContext);

    }
}

-(CGFloat)getStartingPointX:(NSInteger)elementIndex
{
    CGFloat  curLocation =  self.bounds.size.width / (self.numShapesInCard+1);
    curLocation *= elementIndex;
    
    curLocation -= (BASE_SIZE / 2);
    
    return curLocation;
}

-(CGFloat)getStartingPointY:(NSInteger)elementIndex
{
    return self.bounds.size.height/2 - BASE_SIZE/2;
}



@end
