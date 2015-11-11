//
//  CardMatchingGame.m
//  MatchGame
//
//  Created by Tzachi Azo on 11/10/15.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic , readwrite) NSInteger score;
@property (nonatomic , strong) NSMutableArray *cards; //of cards
@property (nonatomic, readwrite ) NSString * status;


@end

@implementation CardMatchingGame

@synthesize numOfCards = _numOfCards;

-(NSInteger)numOfCards
{
    return _numOfCards;
}

-(void)setNumOfCards:(NSInteger)numOfCards{
    _numOfCards = numOfCards;
}

- (NSMutableArray * )cards
{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if(self){
        for(int i = 0 ; i < count ; i++){
            Card * card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }

            
        }
    }
    
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count ) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS  = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSInteger)index
{
    self.status = @"STATUS!!!!";
    NSMutableArray * openCards;
    openCards = [[NSMutableArray alloc] init];
    
    Card * card = [self cardAtIndex:index];
    
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
            self.status = [@"Flip back card: " stringByAppendingString:card.contents];
        }else{
            
            for(Card *otherCard in self.cards){
                if(otherCard.chosen == YES && otherCard.isMatched == NO){
                    [openCards addObject:otherCard];
                }
            }
            
            if(openCards.count == self.numOfCards-1){
                
            
                int matchScore = [card match:openCards];
                self.status = [self cardArrayToString:openCards];
                self.status = [self.status stringByAppendingString: [card.contents stringByAppendingString:@" "]];
                
                if(matchScore){
                    self.status =
                    [self.status stringByAppendingString:[NSString stringWithFormat:@" are Matche! and you got %d points" , matchScore * MATCH_BONUS] ];
                    self.score += matchScore * MATCH_BONUS;
                    //Mark all open cards as Matched
                    for(Card * curCard in openCards){
                        curCard.matched = YES;
                    }
                    card.matched = YES;
                }else{
                    
                    self.status = [self.status stringByAppendingString:@" Are Not Matche!" ];
                    self.score -= MISMATCH_PENALTY;
                    for(Card * curCard in openCards){
                        curCard.chosen = NO;
                    }
                   // card.chosen = NO;
                    //return;
                }
                
                
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
    
    
}


-(NSString *)cardArrayToString:(NSMutableArray *)cardArray
{
    NSString * ans = @"";
    
    for(Card * card in cardArray){
        ans = [[ans stringByAppendingString:[card contents]] stringByAppendingString:@" "] ;
    }
    
    return ans;
    
}


@end
