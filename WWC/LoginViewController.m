//
//  LoginViewController.m
//  WWC
//
//  Created by Stephanie Szeto on 5/20/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "LoginViewController.h"
#import "ProfileFormViewController.h"

@interface LoginViewController ()

- (IBAction)onFindMentorButton:(id)sender;
- (IBAction)onFindMenteeButton:(id)sender;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onFindMentorButton:(id)sender {
    ProfileFormViewController *pfvc = [[ProfileFormViewController alloc] init];
    [self.navigationController pushViewController:pfvc animated:NO];
}

- (IBAction)onFindMenteeButton:(id)sender {
    ProfileFormViewController *pfvc = [[ProfileFormViewController alloc] init];
    [self.navigationController pushViewController:pfvc animated:NO];

}

@end
