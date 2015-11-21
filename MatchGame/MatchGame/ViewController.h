//
//  ViewController.h
//  MatchGame
//
//  Created by Tzachi Azo on 11/9/15.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CardsGame.h"

@interface ViewController : UIViewController

@property (strong , nonatomic) CardsGame * game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtonsSup;



- (IBAction)touchCardButton:(UIButton *)sender;

//-(void) updateUI;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel2;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UITextField *textview;

@property (strong , nonatomic) NSMutableArray * historyArray;
@end

