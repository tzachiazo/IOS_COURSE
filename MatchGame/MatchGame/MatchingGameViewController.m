//
//  MatchingGameViewController.m
//  MatchGame
//
//  Created by Tzachi Azo on 16/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "MatchingGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface MatchingGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtonsSub;


@end

@implementation MatchingGameViewController



@synthesize cardButtons = _cardButtons;
-(NSArray *)cardButtons
{
    if(!_cardButtons)
    {
        _cardButtons = self.cardButtonsSub;
    }
    return _cardButtons;
}


/*
- (id)init {
    if (self = [super init]) {
        self.cardButtons = self.cardButtonsSub;
    }
    return self;
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}


@synthesize game = _game;
- (CardsGame *)game{
    if(!_game)
    {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtonsSub.count usingDeck:[self createDeck]];
    }
    
    return _game;

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
