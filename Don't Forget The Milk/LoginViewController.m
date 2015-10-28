//
//  ViewController.m
//  Don't Forget The Milk
//
//  Created by Julian Hunt on 2015-10-21.
//  Copyright © 2015 Julian Hunt. All rights reserved.
//

#import "LoginViewController.h"
#import "MainMenuTableViewController.h"
#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButtonPressed:(id)sender {
    [self login];
}

- (void) login
{
    MSClient *client = [(AppDelegate *) [[UIApplication sharedApplication] delegate] client];
    MilkUser *user = [(AppDelegate *) [[UIApplication sharedApplication] delegate] user];
    if (client.currentUser != nil) {
        return;
    }
    
    [client loginWithProvider:@"facebook" controller:self animated:YES completion:^(MSUser *u, NSError *error) {
        if(error==nil){
            [user setAzureUserInfo:u];
            MSTable *userTable = [client tableWithName:@"User"];
            [userTable insert:[user toDictionary] completion:^(NSDictionary *insertedItem, NSError *error) {
                if (error) {
                    NSLog(@"Error: %@", error);
                } else {
                    NSLog(@"Item inserted, id: %@", [insertedItem objectForKey:@"id"]);
                }
            }];
            AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
            [appDelegate loadMainView];
            //[appDelegate.window setRootViewController:appDelegate.mainMenu];
            //[self performSegueWithIdentifier:@"loginSegue" sender:self];
        }
    }];
   
}

/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"loginSegue"]){
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        
        appDelegate.mainMenu = segue.destinationViewController;
        [appDelegate.window setRootViewController:appDelegate.mainMenu.navigationController];
    }
}*/




@end
