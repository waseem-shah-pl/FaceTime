//
//  AppDelegate.m
//  sample-chat
//
//  Created by Igor Khomenko on 10/16/13.
//  Copyright (c) 2013 Igor Khomenko. All rights reserved.
//

#import "AppDelegate.h"
#import "DialogsViewController.h"

@implementation AppDelegate
@synthesize userID;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Set QuickBlox credentials (You must create application in admin.quickblox.com)
    //
    [QBSettings setApplicationID:12444];
    [QBSettings setAuthorizationKey:@"8LZ-Q3EsjYtzYA4"];
    [QBSettings setAuthorizationSecret:@"NYGSSv4ZQ8WatEK"];
    [QBSettings setAccountKey:@"pNUamnRj3XDfXn4skAYw"];
    
    
    
    
    
    NSMutableDictionary *videoChatConfiguration = [[QBSettings videoChatConfiguration] mutableCopy];
    [videoChatConfiguration setObject:@20 forKey:kQBVideoChatCallTimeout];
    [videoChatConfiguration setObject:AVCaptureSessionPresetLow forKey:kQBVideoChatFrameQualityPreset];
    [videoChatConfiguration setObject:@2 forKey:kQBVideoChatVideoFramesPerSecond];
    [videoChatConfiguration setObject:@3 forKey:kQBVideoChatP2PTimeout];
    [QBSettings setVideoChatConfiguration:videoChatConfiguration];
    
    
//    [QBSettings setApplicationID:92];
//    [QBSettings setAuthorizationKey:@"wJHdOcQSxXQGWx5"];
//    [QBSettings setAuthorizationSecret:@"BTFsj7Rtt27DAmT"];
//    [QBSettings setAccountKey:@"7yvNe17TnjNUqDoPwfqp"];
    
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
