//
//  AppImageView.m
//  TicTacToeGame
//
//  Created by Bimal Thapa on 12/13/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

#import "AppImageView.h"

@implementation AppImageView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setAutoresizingMask:UIViewAutoresizingNone];
    }
    
    return self;
}

-(void)setImageWith:(NSString *)imageName {
    
    self.image = [UIImage imageNamed:imageName];
}

@end
