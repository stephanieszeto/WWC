//
//  User.m
//  WWC
//
//  Created by Stephanie Szeto on 7/20/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "User.h"

@implementation User

@dynamic name;
@dynamic gender;
@dynamic email;
@dynamic type;
@dynamic facebookID;
@dynamic cover;

# pragma mark - Public methods

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

# pragma mark - Private methods

- (void)fetchUserDataFromFacebook {
    // fetch email, gender, id, name
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            NSLog(@"basic user data: %@", result);
            
            // save values
            self.email = result[@"email"];
            self.name = result[@"name"];
            self.facebookID = (NSInteger) result[@"id"];
            
            if ([result[@"gender"] isEqualToString:@"male"]) {
                self.gender = UserGenderMale;
            } else {
                self.gender = UserGenderFemale;
            }
            
            [self saveUserToParse];
        } else {
            NSLog(@"Error: couldn't fetch data from Facebook");
        }
    }];
}

//- (void)fetchCoverFromFacebook {
//    // only fetch cover for now; about, location, work require approval
//    [FBRequestConnection startWithGraphPath:@"/me?fields=cover,about,location,work"
//                          completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                              if (!error) {
//                                  NSLog(@"extended user data: %@", result);
//
//                                  // save cover ID value
//                                  NSInteger coverID = (NSInteger) result[@"cover"][@"id"];
//                                  
//                                  [self saveUserToParse];
//                              } else {
//                                  NSLog(@"Error: couldn't fetch extended data from Facebook");
//                              }
//                          }];
//}

- (void)saveUserToParse {
    User *user = [User currentUser];
    user[@"email"] = self.email;
    user[@"name"] = self.name;
    user[@"gender"] = @(self.gender);
    user[@"facebookID"] = @(self.facebookID);
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Success: user saved");
        } else {
            NSLog(@"Error: couldn't save user properly");
        }
    }];
}

@end
