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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

//-(void)setGame2: (int) k;

@end

