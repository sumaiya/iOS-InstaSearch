//
//  ISAppDelegate.h
//  InstaSearch
//
//  Created by Sumaiya Hashmi on 9/11/13.
//  Copyright (c) 2013 Sumaiya Hashmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISMainViewController.h"
#import "ISFlickrViewController.h"

@interface ISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ISMainViewController *mainView;
@property (strong, nonatomic) ISFlickrViewController *flickrView;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
