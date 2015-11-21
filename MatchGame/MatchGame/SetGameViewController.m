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
@property (strong, nonatomic) IBOutletCollection(SetCardView) NSArray *setCardsBoard;
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
    // Do any additional setup after loading the view.
    [self updateUI];
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
    for(SetCardView * cardView in self.setCardsBoard){
        NSInteger index = [self.setCardsBoard indexOfObject:cardView];
        SetCard* card = (SetCard *)([self.game cardAtIndex:index]);
    
       
        cardView.isChoosen = card.chosen;
        cardView.numShapesInCard = card.numberOfShapesInCard;
        cardView.shapeNumber = card.shapeID;
        cardView.color = @[[UIColor redColor] , [UIColor blueColor] , [UIColor greenColor] ][card.colorId];
        
        if(card.matched){
            [cardView setAlpha:0];
        }else{
            [cardView setAlpha:1];
        }
        self.scoreLabel.text= [NSString stringWithFormat:@"Score: %ld" ,self.game.score];
    }
    
    self.statusBar.text = self.game.status;
    
    
  
   
}
- (IBAction)onHistorySlide:(UISlider *)sender {

    int msgIndex = sender.value;
   
    self.statusBar.text = (self.historyArray.count == 0)? @"" : self.historyArray[msgIndex];
    
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
