//
//  MilkUser.m
//  Don't Forget The Milk
//
//  Created by Julian Hunt on 2015-10-26.
//  Copyright © 2015 Julian Hunt. All rights reserved.
//

#import "MilkUser.h"

@implementation MilkUser
-(id)init{
    self.userName = @"unknown";
    return self;
}
-(NSDictionary*)toDictionary{
    NSDictionary * result= @{ @"username" : self.userName,
                              @"userid" : self.azureUserInfo.userId};
    return result;
}
@end
