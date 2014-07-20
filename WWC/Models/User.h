//
//  User.h
//  WWC
//
//  Created by Stephanie Szeto on 7/20/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import <Parse/Parse.h>

typedef NS_ENUM(NSInteger, UserGender) {
    UserGenderMale,
    UserGenderFemale
};

typedef NS_ENUM(NSInteger, UserType) {
    UserTypeMentor,
    UserTypeMentee,
    UserTypeMentorMentee
};

@interface User : PFUser

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, assign) NSInteger facebookID;
@property (retain) PFFile *cover;

- (void)fetchUserData;

@end
