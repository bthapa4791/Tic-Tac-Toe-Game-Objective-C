//
//  GameStatusCalculation.h
//  TicTacToeGame
//
//  Created by Bimal Thapa on 12/14/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameStatusCalculation : NSObject

- (BOOL) checkIfWin: (NSMutableDictionary *) gameArray inCurrentTurn: (NSString *) currentTurn;

- (BOOL) checkIfGameIsTie: (NSMutableDictionary *) gameArray;

@end
