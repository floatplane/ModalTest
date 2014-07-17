//
//  BackgroundView.m
//  ModalTest
//
//  Created by Brian Sharon on 7/17/14.
//  Copyright (c) 2014 Brian Sharon. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.touchDelegate gotTouchesBegan];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.touchDelegate gotTouchesCancelled];
    [super touchesCancelled:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.touchDelegate gotTouchesMoved];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.touchDelegate gotTouchesEnded];
    [super touchesEnded:touches withEvent:event];
}

@end
