//
//  SetGame.h
//  MatchGame
//
//  Created by Tzachi Azo on 17/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "CardsGame.h"

@interface SetGame : CardsGame

-(void)add3Cards;

-(void)removeCards:(NSArray *)others;
@end
