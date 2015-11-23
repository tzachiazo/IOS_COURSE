//
//  SetGameViewController.m
//  MatchGame
//
//  Created by Tzachi Azo on 16/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetDeck.h"
#import "SetGame.h"
#import "SetCard.h"
#import "SetCardView.h"

@interface SetGameViewController ()

//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *setCards;
@property (weak, nonatomic) IBOutlet UILabel *lblT;
@property (weak, nonatomic) IBOutlet UILabel *statusBar;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(SetCardView) NSMutableArray *setCardsBoard;
@property (weak, nonatomic) IBOutlet UIView *boardView;
@end

@implementation SetGameViewController


@synthesize cardButtonsSup = _cardButtonsSup;




-(NSArray *)cardButtonsSup
{
    if(!_cardButtonsSup)
    {
       // _cardButtonsSup = self.setCards;
    }
    return _cardButtonsSup;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.boardView.layer.borderColor = [UIColor blackColor].CGColor;
    self.boardView.layer.borderWidth = 2;
    
    // Do any additional setup after loading the view.
    //[self updateUI];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self updateUI];

}

-(UIAttachmentBehavior * ) attach
{
    if(!_attach)
    {
        _attach = [[UIAttachmentBehavior alloc] initWithItem:self.setCardsBoard[0] attachedToAnchor:CGPointMake(50, 50)];
        
    }
    return _attach;
}

-(UIGravityBehavior *)gravity
{
    if(!_gravity){
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.5;
        _gravity.gravityDirection = CGVectorMake(0.2 , 0.6);
        
        
    
        [self.animator addBehavior:self.gravity];
    }
    return _gravity;
}
-(UICollisionBehavior*)collider
{
    if(!_collider)
    {
        _collider = [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:_collider];
    }
    return _collider;
}

-(UIDynamicAnimator *)animator
{
    if(!_animator){
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
       // [_animator addBehavior:self.gravity];
    }
    return _animator;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@synthesize game = _game;
- (CardsGame *)game{
    if(!_game)
    {
        _game = [[SetGame alloc] initWithCardCount:self.setCardsBoard.count usingDeck:[self createDeck]];
    }
    
    return _game;
    
}

@synthesize boardGrid = _boardGrid;
-(Grid *)boardGrid
{
    if(!_boardGrid)
    {
        _boardGrid = [[Grid alloc] init];
        
        [_boardGrid setCellAspectRatio: 2.0/3.0];

        [_boardGrid setSize:self.boardView.bounds.size];
        
        [_boardGrid setMinimumNumberOfCells:12];
        
        
    }
    return _boardGrid;
}

- (IBAction)goButton:(UIButton *)sender {
    
    //[UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionRepeat animations:^{tmp.alpha = 0;} completion:^(BOOL fin){if(fin) [tmp removeFromSuperview];}];
    [self locateCardsOnBoard];
    return;
    //[self.gravity addItem:tmp];
    //[self.collider addItem:tmp];
    if(![self.boardGrid inputsAreValid])
        return;
    
     // pos of cell (1,2)
    
    
    //CGSize cellSize = [self.boardGrid cellSize];
    
    [self.boardGrid frameOfCellAtRow:0 inColumn:0]; // size at cell (1,2)
    
   // UIView * card = self.setCardsBoard[0];
   
    NSUInteger rows = self.boardGrid.rowCount;
    
    for(int i = 0 ;i < self.setCardsBoard.count ; i++)
    {
        UIView * card = self.setCardsBoard[i];
        
        CGRect newFrame = card.frame;
        
        newFrame.size = self.boardGrid.cellSize;
        //newFrame.size.height
        
        [card setFrame:newFrame];
        
        CGPoint  pos  = [self.boardGrid centerOfCellAtRow:i%rows inColumn:i/rows];
        
        [UIView animateWithDuration:0.2 animations:^{
            
            card.center = pos;}
                         completion:^ (BOOL finished){ ;}];
    }
   
    
}


- (IBAction)flippingCard:(UITapGestureRecognizer *)sender {
    
    NSUInteger choosenIndex = [self.setCardsBoard indexOfObject:sender.view];
    [self.game chooseCardAtIndex:choosenIndex];
    [self updateUI];
}

-(Deck *) createDeck
{
    return [[SetDeck alloc] init];
}

-(void) updateUI
{
    NSMutableArray * deletedCards = [[NSMutableArray alloc] init];
    NSMutableArray * deletedCardsViews = [[NSMutableArray alloc] init];
    
    
    for(SetCardView * cardView in self.setCardsBoard){
        NSInteger index = [self.setCardsBoard indexOfObject:cardView];
        SetCard* card = (SetCard *)([self.game cardAtIndex:index]);
        
        
        
        cardView.isChoosen = card.chosen;
        cardView.numShapesInCard = card.numberOfShapesInCard;
        cardView.shapeNumber = card.shapeID;
        cardView.color = @[[UIColor redColor] , [UIColor blueColor] , [UIColor greenColor] ][card.colorId];
        
        if(card.matched){
            //[self removeCard:cardView];
            [deletedCardsViews addObject:cardView];
            [deletedCards addObject:card];
        }else{
            [cardView setAlpha:1];
        }
        self.scoreLabel.text= [NSString stringWithFormat:@"Score: %ld" ,self.game.score];
    }
    
    if([deletedCards count])
    {
        [self removeCards:deletedCardsViews];
        [((SetGame *)self.game) removeCards:deletedCards];
        return;
    }
   
    
    [self locateCardsOnBoard];
    
}

-(void)locateCardsOnBoard
{
    self.boardGrid = nil;
    if(![self.boardGrid inputsAreValid])
        return;
    
    NSUInteger rows = self.boardGrid.rowCount;
    
    for(int i = 0 ;i < self.setCardsBoard.count ; i++)
    {
        UIView * card = self.setCardsBoard[i];
        
        CGRect newFrame = card.frame;
        
        newFrame.size = self.boardGrid.cellSize;
     
        
        [card setFrame:newFrame];
        
        CGPoint  pos  = [self.boardGrid centerOfCellAtRow:i%rows inColumn:i/rows];
        /*
        [UIView animateWithDuration:0.2 animations:^{
            
            card.center = pos;}
                         completion:^ (BOOL finished){ ;} ];
        */
        [UIView animateWithDuration:0.2 delay:0.3
                                     options: UIViewAnimationOptionBeginFromCurrentState
                                  animations:^{
                                      card.center = pos;}
                                  completion:^ (BOOL finished){ ;} ];
    }
}

- (IBAction)add3Cards:(UIButton *)sender {
    if(self.game.cards.count >9)
        return;
    [((SetGame *)self.game) add3Cards];
    
    [self addCardToBoard];
    [self addCardToBoard];
    [self addCardToBoard];
    
   [self updateUI];
    
}





-(void)addCardToBoard
{
  
    SetCardView * newCard = [[SetCardView alloc] initWithFrame:(CGRectMake(0, 0, 20, 20))];
    
    CGRect newFrame = newCard.frame;
    newFrame.size = self.boardGrid.cellSize;
    
    
    [newCard setFrame:newFrame];
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(flippingCard:)];
    
    [newCard addGestureRecognizer:singleFingerTap];
    
    //[singleFingerTap release];
    
    //[newCard addGestureRecognizer:[[UIGestureRecognizer alloc] initWithTarget:nil action:]]
    
    [self.setCardsBoard addObject:newCard];
    
    [self.boardView addSubview:newCard];
}

- (IBAction)onHistorySlide:(UISlider *)sender {

    int msgIndex = sender.value;
   
    self.statusBar.text = (self.historyArray.count == 0)? @"" : self.historyArray[msgIndex];
    
}




-(void)removeCards:(NSArray *)cards
{
    
    [UIView animateWithDuration:0.2 delay:0.0
                        options: UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         for(CardView * card in cards)
                         {
                             card.center = CGPointMake(0, 0);
                         }
                         
                         }
                     completion:^ (BOOL finished){
                         
                         //[card removeFromSuperview];
                         for(CardView * card in cards)
                         {
                             [self.setCardsBoard removeObject:card];
                             [card removeFromSuperview];
                             
                         }
                         [self locateCardsOnBoard];
                         //[card ];
                     }];
    
}

- (IBAction)setCardTouch:(UIButton *)sender {
    
    [self touchCardButton:sender];
   // NSString * d = @"△this is a string!";
  //  UIFont * font =  [UIFont fontWithName:@"Palatino-Roman" size:34.5 ];
  //  NSMutableAttributedString *atr = [[NSMutableAttributedString alloc] initWithString:d];
   
    //[atr addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 3)];
    
 //   [atr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:3] range:NSMakeRange(3, 5)];
    
    //[atr addAttribute:NSStrokeWidthAttributeName value:@"1" range:NSMakeRange(0,5)];
    
//    [atr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, 5)];
    
    
    
    /*
    [atr addAttributes: @{NSBackgroundColorAttributeName : [UIColor redColor],
                          NSUnderlineStyleAttributeName :[NSNumber numberWithInt:3],
                          NSStrokeWidthAttributeName :@"-1",
                          NSFontAttributeName :font,
                          NSForegroundColorAttributeName : [UIColor greenColor],
                          ns
                          }
     
     
                range:NSMakeRange(0, 3)];
    
    
    [self.lblT setAttributedText:atr];
    */
   // [self.setCards[0] set];
 //   [self.setCards[0] setAttributedTitle:atr];
    
  //  NSMutableAttributedString * attr2 = [self.lblT.attributedText mutableCopy ];
    
    //attr2.
    
    //UIColor *_black = [UIColor blackColor];
   // [atr addAttribute:NSForegroundColorAttributeName value:_black ];
    
  //  [sender setTitle:d forState:UIControlStateNormal];
  //  return;
 //   NSUInteger choosenIndex = [self.setCards indexOfObject:sender];
   // [self.game chooseCardAtIndex:choosenIndex];
  //  [self updateUI];
    //
   // [(NSDictionary *) k = atr. attributedIndex(2 , NSMakeRange(0,2));
    //
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
