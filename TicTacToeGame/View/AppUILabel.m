//
//  AppUILabel.m
//  TicTacToeGame
//
//  Created by Bimal Thapa on 12/13/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

#import "AppUILabel.h"

@implementation AppUILabel

-(void)setFrame:(CGRect)frame {
    
    if (!CGRectEqualToRect([self frame], frame)) {
        
        [super setFrame:frame];
        
    }
}

-(void)setLabelTextWith:(NSString *)lblText {
    
    if (![lblText isEqualToString:[self text]]) {
        
        [super setText:lblText];
        
        self.textAlignment = NSTextAlignmentCenter;
    }
}

@end
