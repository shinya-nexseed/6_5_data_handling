//
//  ViewController.m
//  6_5_data_handling
//
//  Created by Shinya Hirai on 2015/08/14.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController () {
    NSDictionary *_dataDict;
    NSArray *_allKeysOfCategories;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"data" ofType:@"plist"];
    
    _dataDict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSLog(@"もくもく会の詳細 = %@", _dataDict[@"相撲界"][@"用語"][@"ハコテ"][@"詳細"]);
    
    // まずは一番上の階層のKeyをとってきてTableViewに並べたい
    // 次のTableviewにはひとつ下の階層のデータを、選択されたCellの文字列(Keyのひとつ)で呼び出して表示したい
    
    // allKeysメソッドを使って、keyだけが入った配列を作る
    _allKeysOfCategories = [_dataDict allKeys];
    for (int i = 0; i < _allKeysOfCategories.count; i++) {
        NSLog(@"_allKeysOfCategories : %i = %@", i, _allKeysOfCategories[i]);
        
        NSDictionary *detailOfCategory = _dataDict[_allKeysOfCategories[i]];
        NSLog(@"カテゴリ名 = %@",detailOfCategory[@"カテゴリ名"]);
    }
    NSLog(@"_allKeysOfCategories 2 = %@", _allKeysOfCategories[2]);
    //                                                         ↑ ここはindexPath.rowで良い
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allKeysOfCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = _allKeysOfCategories[indexPath.row];

    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *detailOfCategory = _dataDict[_allKeysOfCategories[indexPath.row]];
    NSLog(@"カテゴリ名 = %@",detailOfCategory[@"カテゴリ名"]);
    
    AppDelegate *appDelete = [[UIApplication sharedApplication] delegate];
    appDelete.categoryName = _allKeysOfCategories[indexPath.row];
}

@end
