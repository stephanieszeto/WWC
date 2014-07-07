//
//  LoginManager.h
//  WWC
//
//  Created by Stephanie Szeto on 7/6/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

static NSString *kUserDidLoginNotification = @"com.wwc.userdidlogin";
static NSString *kUserDidSignupNotification = @"com.wwc.userdidsignup";
static NSString *kUserDidLogoutNotification = @"com.wwc.userdidlogout";

@interface LoginManager : NSObject <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

+ (LoginManager *)instance;
- (void)logout;

@end
