//
//  GameBoard.m
//  TicTacToeGame
//
//  Created by Bimal Thapa on 12/12/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

#import "GameBoard.h"
#import "AppButton.h"
#import "AppImageView.h"

@interface GameBoard() {
 
    @private
    AppButton *_gameBox;
    
    AppImageView *_boardImage;
}

@end

@implementation GameBoard

- (id)initWithDelegate:(id<GameBoardDelegate>)delegate Frame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _delegate = delegate;
        
        [self setAutoresizingMask:UIViewAutoresizingNone];
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        _boardImage = [[AppImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        [_boardImage setImageWith:@"board"];
        
        _boardImage.contentMode = UIViewContentModeScaleAspectFill;
        
        [self addSubview:_boardImage];
        
        [self setUpView];
    }
    
    return self;
}

#pragma mark-
#pragma mark: Method to create game board on the screen.

- (void) setUpView {
    
    CGFloat X = 2;
    
    CGFloat Y = 2;
    
    CGFloat H = self.frame.size.height / 4;
    
    CGFloat W = self.frame.size.width / 4;

    NSInteger indexTag = 1;
    
    for (int i = 0; i <= 4; i++) {
        
        for (int j = 0; j < 4; j++) {
            
            _gameBox = [[AppButton alloc] initWithFrame:CGRectMake(X, Y, W, H) withTag:indexTag withTitle:nil];
            
            [_gameBox addTarget:self action:@selector(gameBoxClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:_gameBox];
        
            X += W;
            
            indexTag++;
        }
        
        X = 2;
        
        Y += H;
    }
}

#pragma mark-
#pragma mark: Method to handle click event on game board.

- (void) gameBoxClicked: (AppButton *) button {
    
    [self.delegate didGameBoardClicked:button];
}

@end
