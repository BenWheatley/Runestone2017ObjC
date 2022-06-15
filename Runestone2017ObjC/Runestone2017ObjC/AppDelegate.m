//
//  AppDelegate.m
//  Runestone2017ObjC
//
//  Created by Ben Wheatley on 16/09/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configAnalytics];
    [self setupScreenSetting];
    return YES;
}

- (void)configAnalytics {
    Configuration *config = [Configuration alloc];
    config = [config initWithMerchantID: @"1b99bdcf-d582-4f49-9715-1b61dfff3924"];
    [config token:@"f5e27185-b53d-4aee-a9b7-e0579c24d29d"];
    _analytics = [MobioSDK shared];
    [_analytics bindConfigurationWithConfiguration: config];
}

- (void)setupScreenSetting {
    NSNumber *counter = [NSNumber numberWithInt:3];
    NSArray *arrayTimeVisit = [NSArray arrayWithObject:counter];
    [_analytics screenSettingWithTitle:@"MenuMain" controllerName:@"MenuMainViewController" timeVisit: arrayTimeVisit];

}

- (void)setupData {
    [_analytics sendWithDeviceToken:@"this is token"];
}
@end
