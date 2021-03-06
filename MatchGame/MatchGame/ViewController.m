//
//  ViewController.m
//  MatchGame
//
//  Created by Tzachi Azo on 11/9/15.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//
//Master!!!

#import "ViewController.h"
#import "Deck.h"


//#import "CardsGame.h"
//#import "PlayingCard.h"
//#import "PlayingCardDeck.h"
//#import "cardMatchingGame.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UIView *scoreLabel;
//@property (weak, nonatomic) IBOutlet UILabel *scoreLabel2;

@property (weak, nonatomic) IBOutlet UISwitch *matchSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segMatch;

//@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


@end




@implementation ViewController


@synthesize historyArray = _historyArray;

-(NSMutableArray*)historyArray
{
    if(!_historyArray)
    {
        _historyArray = [[NSMutableArray alloc] init];
    }
    return _historyArray;
}
/*
-(void)setHistoryArray:(NSMutableArray *)historyArray
{
    
}*/


- (IBAction)changeCardNum:(UISwitch *)sender {
    if(sender.isOn){
        self.game.numOfCards = 2;
        self.segMatch.selectedSegmentIndex = 1;
        
    }else{
        self.game.numOfCards = 3;
        self.segMatch.selectedSegmentIndex = 0;
        
    }
}

- (IBAction)indexChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
           // self.matchSwitch.selected = YES;
            [self.matchSwitch setOn:NO animated:YES];
            break;
        case 1:
            [self.matchSwitch setOn:YES animated:YES];
            break;
        default:
            break;
            
    }
    [self changeCardNum:self.matchSwitch];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touchCardButton:(UIButton *)sender {
    
    self.game.numOfCards = (self.matchSwitch.on)? 2 : 3;
    self.matchSwitch.enabled = NO;
    self.segMatch.enabled = NO;
    NSUInteger choosenIndex = [self.cardButtonsSup indexOfObject:sender];
    [self.game chooseCardAtIndex:choosenIndex];
    [self updateUI];
}
- (IBAction)ReDeal:(UIButton *)sender {
    self.matchSwitch.enabled = YES;
    self.segMatch.enabled = YES;
    self.game = nil;
    //self.game.numOfCards = (self.matchSwitch.on)? 2 : 3;
    [self updateUI];
}


-(void) updateUI
{
    for(UIButton * curButton in self.cardButtonsSup){
        NSInteger index = [self.cardButtonsSup indexOfObject:curButton];
        Card* card = [self.game cardAtIndex:index];
        
        [curButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [curButton setBackgroundImage:[self backgroundImageToCard:card] forState:UIControlStateNormal];
        curButton.enabled = !card.isMatched;
        self.scoreLabel2.text= [NSString stringWithFormat:@"Score: %ld" ,self.game.score];
    }
    
    self.statusLabel.text = self.game.status;
    
}


- (NSString *) titleForCard:(Card *) card{
    return (card.isChosen)? card.contents : @"";
   // return (card.isChosen)? card.contents : card.contents;
}

- (UIImage *) backgroundImageToCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"CardFront" : @"CardBack"];
    // return [UIImage imageNamed:card.isChosen ? @"CardFront" : @"CardFront"];
}




@end
