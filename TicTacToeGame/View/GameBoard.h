//
//  GameBoard.h
//  TicTacToeGame
//
//  Created by Bimal Thapa on 12/12/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppButton;

@protocol GameBoardDelegate<NSObject>

@required

-(void) didGameBoardClicked:(AppButton *) button;

@end

@interface GameBoard : UIView

- (id) initWithDelegate:(id<GameBoardDelegate>) delegate Frame:(CGRect) frame;

@property (nonatomic, weak) id<GameBoardDelegate> delegate;

@end
