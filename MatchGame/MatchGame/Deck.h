//
//  Deck.h
//  MatchGame
//
//  Created by Tzachi Azo on 11/9/15.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject


- (void)addCard:(Card *) card atTop:(BOOL)atToop;
- (void)addCard:(Card *) card ;

- (Card *)drawRandomCard;

@end
