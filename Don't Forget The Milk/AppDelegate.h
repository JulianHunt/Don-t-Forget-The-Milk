//
//  AppDelegate.h
//  Don't Forget The Milk
//
//  Created by Julian Hunt on 2015-10-21.
//  Copyright © 2015 Julian Hunt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>
#import "MilkUser.h"
#import "LoginViewController.h"
#import "MainMenuTableViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MSClient *client;
@property (strong, nonatomic) MilkUser *user;
@property (strong, nonatomic) MainMenuTableViewController * mainMenu;
@property (strong, nonatomic) UINavigationController * navController;

-(void)loadLoginView;
-(void)loadMainView;
@end

