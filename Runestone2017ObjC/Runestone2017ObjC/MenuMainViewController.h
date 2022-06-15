//
//  MenuMainViewController.h
//  Runestone2017ObjC
//
//  Created by Ben Wheatley on 17/09/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobioSDKSwift/MobioSDKSwift-Swift.h>

@interface MenuMainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) MobioSDK *analytics;

@end
