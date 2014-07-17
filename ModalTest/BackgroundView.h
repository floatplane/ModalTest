//
//  BackgroundView.h
//  ModalTest
//
//  Created by Brian Sharon on 7/17/14.
//  Copyright (c) 2014 Brian Sharon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackgroundViewDelegate <NSObject>

- (void)gotTouchesBegan;
- (void)gotTouchesMoved;
- (void)gotTouchesCancelled;
- (void)gotTouchesEnded;

@end

@interface BackgroundView : UIView

@property (nonatomic) id<BackgroundViewDelegate> touchDelegate;

@end
