//
//  YLDiscoverTableViewController.m
//  YLSinaBlog
//
//  Created by LongMa on 15/11/29.
//  Copyright © 2015年 LongMa. All rights reserved.
//

#import "YLDiscoverTableViewController.h"

@interface YLDiscoverTableViewController ()

@end

@implementation YLDiscoverTableViewController

- (void)viewDidLoad {
    YLLOG(@"%s",__func__);
    [super viewDidLoad];
    
    YLSearchBar *searchBar = [YLSearchBar searchBar];
    searchBar.height = 40;
    searchBar.width = 300;
    //    添加搜索框
    self.navigationItem.titleView = searchBar;
}

@end