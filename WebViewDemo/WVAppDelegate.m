//
//  WVAppDelegate.m
//  WebViewDemo
//
//  Created by Nirav Savjani on 10/28/13.
//  Copyright (c) 2013 Nirav Savjani. All rights reserved.
//

#import "WVAppDelegate.h"
#import "WVDemoViewController.h"

@implementation WVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  WVDemoViewController *demoViewController = [[WVDemoViewController alloc] init];
  self.window.rootViewController = demoViewController;
  
  [self.window makeKeyAndVisible];
  return YES;
}


@end
