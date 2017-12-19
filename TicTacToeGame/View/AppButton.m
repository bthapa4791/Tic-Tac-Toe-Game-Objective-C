//
//  AppButton.m
//  TicTacToeGame
//
//  Created by Bimal Thapa on 12/12/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

#import "AppButton.h"

@implementation AppButton


- (id)initWithFrame:(CGRect)frame withTag:(NSInteger)tag withTitle:(NSString *)btnTitle {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setAutoresizingMask:UIViewAutoresizingNone];
        
        [self setShowsTouchWhenHighlighted:YES];
        
        [self setAdjustsImageWhenHighlighted:YES];
        
        [self setTag:tag];
        
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        
        [[self titleLabel] setBaselineAdjustment:UIBaselineAdjustmentAlignCenters];
        
        [[self titleLabel] setAutoresizingMask:UIViewAutoresizingNone];
        
        [self setTitle:btnTitle forState:UIControlStateNormal];
    }
    
    return self;
}

@end
