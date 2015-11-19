//
//  CardView.m
//  MatchGame
//
//  Created by Tzachi Azo on 18/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "CardView.h"

@implementation CardView
#pragma mark - all functions

- (void) drawCard:(CGRect)aRect
{
    
}

-(void)setSuit:(NSString *)suit
{
    _suit = suit;
    [self setNeedsDisplay];
}

-(void)setRank:(NSUInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}

-(void)setFaceUp:(bool)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}


#define STANDART_HEIGHT 180.0
#define STANDART_RADIUS 12.0

-(CGFloat)cornerScaleFactor { return self.bounds.size.height / STANDART_HEIGHT;}
-(CGFloat)cornerRadius {return STANDART_RADIUS * [self cornerScaleFactor];}
-(CGFloat)cornerOffset {return [self cornerRadius] / 3.0;}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *roundRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    
    [roundRect addClip];
    
   [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundRect stroke];
    
    //[self drawCorner];
    
    
    //[self drawShapes];
    
    [self drawContent];
  
    
}

-(void)drawContent
{
    
}

-(NSString *)rankToString:(NSUInteger) rank
{
    return (@[@"?" , @"A" , @"2" , @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K" ][rank]);
}

-(void) drawShapes
{
    //TreAngle
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(self.bounds.size.width /2,20)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width /2 + self.bounds.size.width /8 ,50 )];
    [path addLineToPoint:CGPointMake(self.bounds.size.width /2 - self.bounds.size.width /8,50 )];
    [path closePath];
    
    [[UIColor greenColor] setFill];
    [[UIColor redColor] setStroke];
    
    [path fill];
    [path stroke];
    
    [path addClip];
    //cyrcle
    
    UIBezierPath *myCyrcle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.bounds.size.width /2 , self.bounds.size.height/2, 50, 50)];
    [[UIColor greenColor] setFill];
    [[UIColor redColor] setStroke];
    
    [myCyrcle fill];
    [myCyrcle stroke];
    
    [myCyrcle addClip];
    
    
    
    //rectangle
    
    
    UIBezierPath * myRect = [UIBezierPath bezierPathWithRect:CGRectMake(self.bounds.size.width /2 , self.bounds.size.height/2, 50, 50) ];
    
    [[UIColor greenColor] setFill];
    [[UIColor redColor] setStroke];
    
    [myRect fill];
    [myRect stroke];
    
    [myRect addClip];
    
   
   
}



-(void)drawCorner
{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@" , [self rankToString:self.rank] , self.suit] attributes:@{NSFontAttributeName: cornerFont, NSParagraphStyleAttributeName:paragraphStyle}];
    
    CGRect textBounds;
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBounds.size = [cornerText size];
    
    [cornerText drawInRect:textBounds];
    
    
    CGContextRef  cardContext = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(cardContext, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(cardContext, M_PI);
    
    [cornerText drawInRect:textBounds];
    
    
}

-(void)awakeFromNib
{
    [self setup];
}
-(void)setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        
    }
    return self;
}


@end
