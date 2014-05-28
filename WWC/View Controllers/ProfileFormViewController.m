//
//  ProfileFormViewController.m
//  WWC
//
//  Created by Stephanie Szeto on 5/20/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "ProfileFormViewController.h"
#import "MenuViewController.h"

@interface ProfileFormViewController ()

- (IBAction)onSubmitButton:(id)sender;

@end

@implementation ProfileFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Profile Form";
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

- (IBAction)onSubmitButton:(id)sender {
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
    MenuViewController *mvc = [[MenuViewController alloc] init];
    [self.navigationController pushViewController:mvc animated:NO];
}

@end
