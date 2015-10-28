//
//  MilkUser.h
//  Don't Forget The Milk
//
//  Created by Julian Hunt on 2015-10-26.
//  Copyright © 2015 Julian Hunt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>
@interface MilkUser : NSObject

@property (strong, nonatomic) NSString * userName;
@property (strong, nonatomic) MSUser * azureUserInfo;


-(NSDictionary*)toDictionary;

@end
