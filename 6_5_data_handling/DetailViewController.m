//
//  DetailViewController.m
//  6_5_data_handling
//
//  Created by Shinya Hirai on 2015/08/14.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController () {
    NSDictionary *_dataDict;
    NSArray *_allKeysOfCategories;
    
    NSDictionary *_wordsDict;
    NSArray *_allKeysOfWords;
}


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.label1.text = _dataDict[appDelegate.categoryName][@"カテゴリ名"];
    self.label2.text = _dataDict[appDelegate.categoryName][@"画像名"];
    NSLog(@"用語 = %@", _dataDict[appDelegate.categoryName][@"用語"]);
    _wordsDict = _dataDict[appDelegate.categoryName][@"用語"];
    
    _allKeysOfWords = [_wordsDict allKeys];
    for (int i = 0; i < _allKeysOfWords.count; i++) {
        NSLog(@"allKeysOfWords : %i = %@",i, _allKeysOfWords[i]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allKeysOfWords.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = _allKeysOfWords[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
