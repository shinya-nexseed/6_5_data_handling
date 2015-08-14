//
//  DetailViewController.h
//  6_5_data_handling
//
//  Created by Shinya Hirai on 2015/08/14.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
