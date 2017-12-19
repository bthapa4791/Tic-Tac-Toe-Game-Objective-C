//
//  GameStatusCalculation.m
//  TicTacToeGame
//
//  Created by Bimal Thapa on 12/14/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

#import "GameStatusCalculation.h"

@interface GameStatusCalculation() {

    NSInteger _currentCount;
    
    NSString *_currentTurn;
}

@end

@implementation GameStatusCalculation

#pragma mark-
#pragma mark: Method to return bool status based on the checking the game board.

- (BOOL) checkIfWin: (NSMutableDictionary *) gameArray inCurrentTurn:(NSString *)currentTurn {

    _currentTurn = currentTurn;

    return [self checkRowsIfWin:gameArray] || [self checkColumnsIfWin:gameArray] || [self checkDiagonalIfWin:gameArray] || [self checkFourCornersIfWin:gameArray] || [self check2X2SquareIfWin:gameArray];
}

#pragma mark-
#pragma mark: Method to return bool based on if game board is all filled.

-(BOOL) checkIfGameIsTie: (NSMutableDictionary *) gameArray {
    
    if (gameArray.count != 16) {
        
        return NO;
    }
    
    return YES;
}

#pragma mark-
#pragma mark: Method to return bool based on if any row is filled with same objects.

- (BOOL) checkRowsIfWin: (NSMutableDictionary *) gameArray {
    
    for (int i = 0; i < 16; i += 4) {
    
        _currentCount = 0;
    
        for (int j = 0; j < 4; j++) {
            
            if (![_currentTurn isEqualToString:[gameArray objectForKey:[NSNumber numberWithInt:i+j]]]) {
                
                break;
            }
            
            _currentCount++;
        }
        
        if (_currentCount == 4) {
            
            return YES;
        }
    }
    
    return NO;
}

#pragma mark-
#pragma mark: Method to return bool based on if any column is filled with same objects.

- (BOOL) checkColumnsIfWin: (NSMutableDictionary *) gameArray {
 
    for (int i = 0; i < 4; i++) {
        
        _currentCount = 0;
    
        for (int j = 0; j < 16; j += 4) {
            
            if (![_currentTurn isEqualToString:[gameArray objectForKey:[NSNumber numberWithInt:i+j]]]) {
                
                break;
            }
            
            _currentCount++;
        }
        
        if (_currentCount == 4) {
            
            return YES;
        }
    }
    
    return NO;
}

#pragma mark-
#pragma mark: Method to return bool based on if any diagonal is filled with same objects.

- (BOOL) checkDiagonalIfWin: (NSMutableDictionary *) gameArray {

    _currentCount = 0;

    for (int i = 0; i < 16; i += 5) {

        if (![_currentTurn isEqualToString:[gameArray objectForKey:[NSNumber numberWithInt:i]]]) {
            
            break;
        }
        
        _currentCount++;
    }

    if (_currentCount == 4) {

        return YES;

    } else {

        _currentCount = 0;

        for (int i = 12; i > 2; i -= 3) {

            if (![_currentTurn isEqualToString:[gameArray objectForKey:[NSNumber numberWithInt:i]]]) {
                
                break;
            }
            
            _currentCount++;
        }

        if (_currentCount == 4) {
            
            return YES;
        }
    }

    return NO;
}

#pragma mark-
#pragma mark: Method to return bool based on if 4 corners is filled with same objects.

-(BOOL) checkFourCornersIfWin: (NSMutableDictionary *) gameArray {

    for (int i = 0; i < 16; i+=12) {
        
        for (int j = 0; j < 4; j+=3) {
            
            if (![_currentTurn isEqualToString:[gameArray objectForKey:[NSNumber numberWithInt:i+j]]]) {
                
                return NO;
            }
        }
    }
    
    return  YES;
}

#pragma mark-
#pragma mark: Method to return bool based on if 2X2 square is same.

-(BOOL) check2X2SquareIfWin: (NSMutableDictionary *) gameArray {
    
    for (int i = 0; i < 11; i++) {
        
        if (i != 3 && i != 7) {
         
            if ([_currentTurn isEqualToString:[gameArray objectForKey:[NSNumber numberWithInt:i]]] && [_currentTurn isEqualToString:[gameArray objectForKey:[NSNumber numberWithInt:i+1]]] && [_currentTurn isEqualToString:[gameArray objectForKey:[NSNumber numberWithInt:i+4]]] && [_currentTurn isEqualToString:[gameArray objectForKey:[NSNumber numberWithInt:i+5]]]) {
                
                return YES;
            }
        }
    }
    
    return NO;
}


@end
