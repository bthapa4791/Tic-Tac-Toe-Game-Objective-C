//
//  AppMacros.h
//  TicTacToeGame
//
//  Created by Bimal Thapa on 12/12/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

#ifndef AppMacros_h
#define AppMacros_h

#import <UIKit/UIKit.h>

#define IS_IPAD (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define GAMEBOARDWIDTH (SCREEN_WIDTH - SCREEN_WIDTH * 0.1)

#define GAMEBOARDHEIGHT SCREEN_HEIGHT * 0.5

#endif /* Header_h */
