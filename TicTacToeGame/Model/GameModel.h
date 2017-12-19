//
//  GameModel.h
//  TicTacToeGame
//
//  Created by Bimal Thapa on 12/12/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GameMark) {
    GameMarkNone,
    GameMarkX,
    GameMarkO
};

typedef NS_ENUM(NSInteger, GameState) {
    GameStateXTurn,
    GameStateOTurn,
    GameStateXWin,
    GameStateOWin,
    GameStateGameTie
};

@interface GameModel : NSObject

@end
