//
//  AppDelegate.h
//  6_5_data_handling
//
//  Created by Shinya Hirai on 2015/08/14.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *categoryName;
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) NSString *categoryName;


@end

