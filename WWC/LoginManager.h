//
//  LoginManager.h
//  WWC
//
//  Created by Stephanie Szeto on 7/6/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface LoginManager : NSObject <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

+ (LoginManager *)instance;
- (void)logout;

@end
