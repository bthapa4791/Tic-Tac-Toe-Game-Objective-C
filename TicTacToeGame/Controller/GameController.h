//
//  GameController.h
//  TicTacToeGame
//
//  Created by Bimal Thapa on 12/12/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"
#import "GameStatusCalculation.h"

@interface GameController : UIViewController

@property (nonatomic) GameState gameState;

@property (nonatomic, strong) GameStatusCalculation *gameStatusCalculation;

@end
