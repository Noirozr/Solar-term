//
//  AppDelegate.h
//  Solar term
//
//  Created by Yongjia Liu on 14-3-30.
//  Copyright (c) 2014年 Yongjia Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "directoryTableViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITableViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)directoryTableViewController *viewController;
@end
