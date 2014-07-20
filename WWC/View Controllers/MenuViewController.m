//
//  MenuViewController.m
//  WWC
//
//  Created by Stephanie Szeto on 5/19/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "MenuViewController.h"
#import "UsersViewController.h"
#import "ProfileViewController.h"
#import "LoginViewController.h"
#import "LoginManager.h"
#import "User.h"

@interface MenuViewController ()

@property (nonatomic, strong) User *user;

- (IBAction)onFindMentorsButton:(id)sender;
- (IBAction)onFindMenteesButton:(id)sender;
- (IBAction)onProfileButton:(id)sender;
- (IBAction)onMentorsButton:(id)sender;
- (IBAction)onMenteesButton:(id)sender;

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Menu";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // check if user info populated
    User *currentUser = [User currentUser];
    [currentUser fetchUserData];
    self.user = currentUser;
    
    // set up navigation bar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log Out" style:UIBarButtonItemStylePlain target:self action:@selector(onLogOut:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Navigational methods

- (void)onLogOut:(id)sender {
    LoginManager *loginManager = [LoginManager instance];
    [loginManager logout];
}

- (IBAction)onFindMentorsButton:(id)sender {
    UsersViewController *uvc = [[UsersViewController alloc] init];
    [self.navigationController pushViewController:uvc animated:NO];
}

- (IBAction)onFindMenteesButton:(id)sender {
    UsersViewController *uvc = [[UsersViewController alloc] init];
    [self.navigationController pushViewController:uvc animated:NO];
}

- (IBAction)onProfileButton:(id)sender {
    ProfileViewController *pvc = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:pvc animated:NO];
}

- (IBAction)onMentorsButton:(id)sender {
    UsersViewController *uvc = [[UsersViewController alloc] init];
    [self.navigationController pushViewController:uvc animated:NO];

}

- (IBAction)onMenteesButton:(id)sender {
    UsersViewController *uvc = [[UsersViewController alloc] init];
    [self.navigationController pushViewController:uvc animated:NO];

}
@end
