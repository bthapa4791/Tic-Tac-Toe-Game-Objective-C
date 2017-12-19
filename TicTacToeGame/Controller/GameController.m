//
//  GameController.m
//  TicTacToeGame
//
//  Created by Bimal Thapa on 12/12/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

#import "GameController.h"
#import "AppButton.h"
#import "GameBoard.h"
#import "GameModel.h"
#import "AppMacros.h"
#import "AppUILabel.h"
#import "AppImageView.h"
#import "UIColor+AppColors.h"

@interface GameController () <GameBoardDelegate> {
    
    @private
    AppButton *_newGameButton;
    
    AppUILabel *_gameInfoLabel;
    
    AppImageView *_currentPlayerImage;
    
    GameBoard *_gameBoard;

    NSMutableDictionary *_newGameArray;
}

@end

@implementation GameController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Tic Tac Toe";
    
    [self setUpView];
    
    [self initializeUpGameBoard];

    _newGameArray = [[NSMutableDictionary alloc] initWithCapacity:16];

    self.gameStatusCalculation = [GameStatusCalculation new];
}

#pragma mark-
#pragma mark: Set up function to create all the components for game.

- (void) setUpView {
    
    self.view.backgroundColor = [UIColor lightGrayColor];

    [self setUpGameInfoLabel];
    
    [self setUpGameBoard];
    
    [self setUpNewGameButton];
    
}

#pragma mark-
#pragma mark: Add subview for showing current player.

- (void) setUpGameInfoLabel {
    
    _gameInfoLabel = [[AppUILabel alloc] initWithFrame:CGRectMake(GAMEBOARDWIDTH / 2 - 150 / 2, self.navigationController.navigationBar.frame.size.height * 1.8, 150, SCREEN_HEIGHT * 0.1)];

    [_gameInfoLabel setLabelTextWith:@"Current Player: "];
    
    [self.view addSubview:_gameInfoLabel];
    
    _currentPlayerImage = [[AppImageView alloc] initWithFrame:CGRectMake(GAMEBOARDWIDTH * 0.5 + _gameInfoLabel.frame.size.width / 4, self.navigationController.navigationBar.frame.size.height * 1.5, 100, 100)];
    
    [self updateCurrentPlayerInfoImageWith:@"X"];
    
    [self.view addSubview:_currentPlayerImage];
}


#pragma mark-
#pragma mark: Add subview for showing Tic Tac Toe game board.

- (void) setUpGameBoard {
    
    _gameBoard = [[GameBoard alloc] initWithDelegate:self Frame:CGRectMake(SCREEN_WIDTH / 2 - GAMEBOARDWIDTH / 2, SCREEN_HEIGHT / 2 - GAMEBOARDHEIGHT / 2 + _currentPlayerImage.frame.size.height * 0.1, GAMEBOARDWIDTH, GAMEBOARDHEIGHT)];
    
    [self.view addSubview:_gameBoard];

}

#pragma mark-
#pragma mark: Add subview for showing new game button below the game board.

- (void) setUpNewGameButton {
    
    _newGameButton = [[AppButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - GAMEBOARDWIDTH * 0.4 / 2, _gameInfoLabel.frame.size.height + _gameBoard.frame.origin.y + _gameBoard.frame.size.height, GAMEBOARDWIDTH * 0.4, SCREEN_HEIGHT * 0.1) withTag:18 withTitle:@"NEW GAME"];
    
    [_newGameButton addTarget:self action:@selector(newGameButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [_newGameButton setBackgroundColor:[UIColor buttonColor]];
    
    [self.view addSubview:_newGameButton];
    
}

#pragma mark-
#pragma mark: Method to update the current player image at the top of game board.

- (void) updateCurrentPlayerInfoImageWith: (NSString *) imageName {
    
     [_currentPlayerImage setImageWith:imageName];
}

#pragma mark-
#pragma mark: Method to initialize the first player turn.

-(void) initializeUpGameBoard {
    
   self.gameState = GameStateXTurn;
}

#pragma mark-
#pragma mark: Method to return string based on GameState.

- (NSString *) getGameStateString {
    
    switch (self.gameState) {
            
        case GameStateXTurn:
            
            return @"X";
        
        case GameStateOTurn:
            
            return @"O";
            
        case GameStateXWin:
            
            return @"X Wins!!!";
            
        case GameStateOWin:
            
            return @"O Wins!!!";
            
        case GameStateGameTie:
            
            return @"Game Tie!!!";
            
        default:
            
            break;
    }
}

#pragma mark-
#pragma mark: Method to return string based on GameMark.

- (NSString *) getGameMarkString: (GameMark) gameMark {
    
    switch (gameMark) {
            
        case GameMarkNone:
            
            return @"-";
            
        case GameMarkX:
            
            return @"X";
            
        case GameMarkO:
            
            return @"O";
            
        default:
            
            break;
    }
}

#pragma mark-
#pragma mark: Method to check the status of game.

- (void) checkGameStatus {
    
    if ([self.gameStatusCalculation checkIfWin:_newGameArray inCurrentTurn:[self getGameStateString]]) {

        if (_gameState == GameStateXTurn) {

            _gameState = GameStateXWin;

        } else {

            _gameState = GameStateOWin;
        }

        [self displayAlertMessage:[self getGameStateString]];
    }

    if ( ![self.gameStatusCalculation checkIfWin:_newGameArray inCurrentTurn:[self getGameStateString]] && [self.gameStatusCalculation checkIfGameIsTie:_newGameArray]) {

        _gameState = GameStateGameTie;

        [self displayAlertMessage:[self getGameStateString]];
    }
}

#pragma mark-
#pragma mark: Method to display alert regarding the different game state.

- (void) displayAlertMessage: (NSString *) msg {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Game Status" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self dismissViewControllerAnimated:YES completion: nil];
        
        [self cleanGameBoard];
    }];
    
    [alertController addAction:okButton];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark-
#pragma mark: Method to clean and re-initialize the game board.

- (void) cleanGameBoard {
    
        for (int i = 1; i < 17;  i++) {
            
            AppButton *btn = (AppButton *) [_gameBoard viewWithTag:i];
            
            [btn setImage:nil forState:UIControlStateNormal];
        }
    
    [self initializeUpGameBoard];
    
    [self updateCurrentPlayerInfoImageWith:@"X"];
    
    [_newGameArray removeAllObjects];
}

#pragma mark-
#pragma mark Action Handlers

- (void) newGameButtonClicked: (AppButton *) button {
    
     if (button.tag == 18) {
     
        [self cleanGameBoard];
     }
}

#pragma mark-
#pragma mark GameBoardDelegate

- (void)didGameBoardClicked:(AppButton *)button {
    
    NSInteger buttonTag = button.tag - 1;
    
    if (![_newGameArray objectForKey:[NSNumber numberWithInteger:buttonTag]]) {
        
        if (_gameState == GameStateXTurn) {
            
            [button setImage:[UIImage imageNamed:@"X"] forState:UIControlStateNormal];
            
            [_newGameArray setObject:[self getGameMarkString:GameMarkX] forKey:[NSNumber numberWithInteger:buttonTag]];
            
            [self updateCurrentPlayerInfoImageWith:@"O"];
            
            [self checkGameStatus];
            
            _gameState = GameStateOTurn;
       
        } else {
            
            [button setImage:[UIImage imageNamed:@"O"] forState:UIControlStateNormal];
            
            [_newGameArray setObject:[self getGameMarkString:GameMarkO] forKey:[NSNumber numberWithInteger:buttonTag]];
            
            [self updateCurrentPlayerInfoImageWith:@"X"];
            
            [self checkGameStatus];
            
            _gameState = GameStateXTurn;
        }
    }
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
