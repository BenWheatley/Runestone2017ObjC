//
//  AppDelegate.h
//  Runestone2017ObjC
//
//  Created by Ben Wheatley on 16/09/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobioSDKSwift/MobioSDKSwift-Swift.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MobioSDK *analytics;

@end

