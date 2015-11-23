//
//  SetGameViewController.h
//  MatchGame
//
//  Created by Tzachi Azo on 16/11/2015.
//  Copyright © 2015 Tzachi Azo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "viewController.h"

@interface SetGameViewController : ViewController

@property (strong , nonatomic) UIGravityBehavior *gravity;
@property (strong , nonatomic) UIDynamicAnimator *animator;
@property (strong , nonatomic) UICollisionBehavior *collider;
@property (nonatomic) UIAttachmentBehavior * attach;
@end
