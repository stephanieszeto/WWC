//
//  AppDelegate.m
//  WWC
//
//  Created by Stephanie Szeto on 5/19/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginManager.h"
#import "MenuViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // set up Parse, Facebook
    [Parse setApplicationId:@"HAsRA0rfixoHXqehmRV6Cl5KdN2kvyzBLlBZyXqj"
                  clientKey:@"aJVjaRNzDu5A3zDVMaSisjokM0yXW4TRzbNYVNrA"];
    [PFFacebookUtils initializeFacebook];
    
    // set up root view controller, notifications
    [self setRootViewController];
    [self subscribeToNotifications];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self unsubscribeToNotifications];
    [[PFFacebookUtils session] close];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

# pragma mark - Private methods

- (void)setRootViewController {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        MenuViewController *menuVC = [[MenuViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:menuVC];
        self.window.rootViewController = navigationController;
    } else {
        LoginManager *loginManager = [LoginManager instance];
        
        SignUpViewController *signUpVC = [[SignUpViewController alloc] init];
        signUpVC.delegate = loginManager;
        
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        loginVC.delegate = loginManager;
        loginVC.signUpController = signUpVC;
        loginVC.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsFacebook | PFLogInFieldsSignUpButton | PFLogInFieldsDismissButton;
        [loginVC setFacebookPermissions:@[@"public_profile", @"email", @"friends_about_me"]];
        
        self.window.rootViewController = loginVC;
    }
}

- (void)subscribeToNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setRootViewController) name:kUserDidLoginNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setRootViewController) name:kUserDidLogoutNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setRootViewController) name:kUserDidSignupNotification object:nil];
}

- (void)unsubscribeToNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kUserDidLoginNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kUserDidLogoutNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kUserDidSignupNotification object:nil];
}

@end
