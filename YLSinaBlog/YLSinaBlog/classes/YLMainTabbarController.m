//
//  YLMainTabbarController.m
//  YLSinaBlog
//
//  Created by LongMa on 15/11/29.
//  Copyright © 2015年 LongMa. All rights reserved.
//

#import "YLMainTabbarController.h"
#import "YLHomeTableViewController.h"
#import "YLMessageTableViewController.h"
#import "YLDiscoverTableViewController.h"
#import "YLProfileTableViewController.h"

@interface YLMainTabbarController ()

@end

@implementation YLMainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    添加子控制器
    [self addChildController:[[YLHomeTableViewController alloc] init] WithTitle:@"首页"
             normalImageName:@"tabbar_home"
               selectedImage:@"tabbar_home_highlighted"];
    
    [self addChildController:[[YLMessageTableViewController alloc] init] WithTitle:@"信息"
             normalImageName:@"tabbar_message_center"
               selectedImage:@"tabbar_message_center_highlighted"];
    [self addChildController:[[YLDiscoverTableViewController alloc] init] WithTitle:@"发现"
             normalImageName:@"tabbar_discover"
               selectedImage:@"tabbar_discover_highlighted"];
    
    [self addChildController:[[YLProfileTableViewController alloc] init] WithTitle:@"我"
             normalImageName:@"tabbar_profile"
               selectedImage:@"tabbar_profile_highlighted"];
}

- (void)addChildController:(UIViewController *)childVC WithTitle:(NSString *)title normalImageName:(NSString *)normalImg selectedImage:(NSString *)selectedImage{
    childVC.title = title;
    childVC.tabBarItem.image = [[UIImage imageNamed:normalImg]
                                imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]
                                        imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    //    文字非系统渲染，不是设置self.tabBarItem
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:(UIControlStateSelected)];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVC];
    
    childVC.view.backgroundColor = YLRandomColor;
    [self addChildViewController:nav];
    
    
    //   按钮不显示原因(见天色！)：1.没设置大小  2.被覆盖（通过查看运行时的3维视图，可以排除这种）
    UIButton *backBtn = [[UIButton alloc] init];
    //    坐标无效，因为赋值时leftBarButtonItem已经确定了按钮的位置
    backBtn.frame = CGRectMake(1000, 100, 30, 30);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"compose_emoticonbutton_background"] forState:(UIControlStateNormal)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"compose_emoticonbutton_background_highlighted"] forState:(UIControlStateHighlighted)];
    childVC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}



@end
