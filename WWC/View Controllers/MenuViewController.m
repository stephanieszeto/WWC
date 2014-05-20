//
//  MenuViewController.m
//  WWC
//
//  Created by Stephanie Szeto on 5/19/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "MenuViewController.h"
#import "UsersViewController.h"

@interface MenuViewController ()

- (IBAction)onFindMentorsButton:(id)sender;
- (IBAction)onFindMenteesButton:(id)sender;
- (IBAction)onProfileButton:(id)sender;

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization-
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

- (IBAction)onFindMentorsButton:(id)sender {
    UsersViewController *uvc = [[UsersViewController alloc] init];
    [self.navigationController pushViewController:uvc animated:NO];
}

- (IBAction)onFindMenteesButton:(id)sender {
}

- (IBAction)onProfileButton:(id)sender {
}
@end
