//
//  ProfileViewController.m
//  WWC
//
//  Created by Stephanie Szeto on 5/19/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "ProfileViewController.h"
#import "User.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Profile";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // load data
    [self fetchUserData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Private methods

- (void)fetchUserData {
    User *user = [User currentUser];
    if (![PFFacebookUtils isLinkedWithUser:user]) {
        [PFFacebookUtils linkUser:user permissions:nil block:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // successful facebook link
                [self fetchUserDataFromFacebook];
            } else {
                NSLog(@"Error: unsuccessful Facebook / PFUser link");
            }
        }];
    } else {
        // user already linked
        [self fetchUserDataFromFacebook];
    }
}

- (void)fetchUserDataFromFacebook {
    // fetch email, first_name, gender, id, last_name, link, locale, name, timezone, updated_time, verified status
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            NSLog(@"user data: %@", result);
        } else {
            NSLog(@"Error: couldn't fetch data from Facebook");
        }
    }];
    
    // only fetch cover for now; about, location, work require approval
    [FBRequestConnection startWithGraphPath:@"/me?fields=cover,about,location,work"
                          completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                              if (!error) {
                                  NSLog(@"extended user data: %@", result);
                              } else {
                                  NSLog(@"Error: couldn't fetch extended data from Facebook");
                              }
                          }];
}

@end
