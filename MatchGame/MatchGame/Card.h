//
//  Card.h
//  MatchGame
//
//  Created by Tzachi Azo on 11/9/15.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong , nonatomic) NSString *contents;

@property (nonatomic ) BOOL chosen;
@property (nonatomic ) BOOL matched;

- (int)match:(NSArray *) otherCards;


@end
