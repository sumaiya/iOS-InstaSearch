//
//  ISAppDelegate.m
//  InstaSearch
//
//  Created by Sumaiya Hashmi on 9/11/13.
//  Copyright (c) 2013 Sumaiya Hashmi. All rights reserved.
//
// tab bar icons from glyphish.com

#import "ISAppDelegate.h"

@implementation ISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //create the tab bar controller object
    self.tabBarController = [[UITabBarController alloc] init];
    
//    UIImage* iImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"instasearchLogo" ofType:@"png"]];
    
    
    //create the first view controller
    self.mainView = [[ISMainViewController alloc] initWithNibName:@"ISMainViewController" bundle:nil];
    [self.mainView.view setFrame:[[UIScreen mainScreen] bounds]];
    //this is where we set the main (instagram) view's representation on the tab bar
    self.mainView.tabBarItem = [[UITabBarItem alloc]                              initWithTitle:@"Instagram" image:[UIImage imageNamed:@"86-camera.png"] tag:1];

    //create the second view controller
    self.flickrView = [[ISFlickrViewController alloc] initWithNibName:@"ISFlickrViewController" bundle:nil];
    [self.flickrView.view setFrame:[[UIScreen mainScreen] bounds]];
    //this is where we set the flickr view's representation on the tab bar
    self.flickrView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Flickr" image:[UIImage imageNamed:@"41-picture-frame.png"] tag:2];
    
    
    //add the viewcontrollers to the tab bar
    [self.tabBarController setViewControllers:[NSArray arrayWithObjects:self.mainView, self.flickrView, nil] animated:YES];
    
    //add the tabbarcontroller as the root view for the App
    [self.window setRootViewController:self.tabBarController];
    
    // OLD STUFF:
    //   self.mainView = [[ISMainViewController alloc] initWithNibName:@"ISMainViewController" bundle:nil]; //create mainView
    //    [self.window addSubview: self.mainView.view]; //mainView is a view controller, not a view

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
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
