//
//  BaseViewController.m
//  NoNetworkView
//
//  Created by honyork on 2016/11/9.
//  Copyright © 2016年 HuaJianCi. All rights reserved.
//

#import "BaseViewController.h"
#import "NoNetworkView.h"
#import "ReachabilityViewController.h"

#define SCREEN_WIDTH              ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT             ([UIScreen mainScreen].bounds.size.height)

@interface BaseViewController ()<CheckNetworkDelegate>

@end

@implementation BaseViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 如果没网,加载无网占位图
    if (![ReachabilityViewController isConnectionAvailable]) {
        // 无网加载无网站位图
        [self showNoNetworkView];
    }else{
        // 有网移除所有无网展位图
        for (NoNetworkView *view in self.view.subviews) {
            if ([view isMemberOfClass:[NoNetworkView class]]) {
                [view removeFromSuperview];
            }
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
}

/** 显示无网络view */
- (void)showNoNetworkView{
    // 将导航栏和tabbar留出来
    NoNetworkView *noNetworkView = [[NoNetworkView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 49)];
    noNetworkView.delegate = self;
    [self.view addSubview:noNetworkView];
}

/** 重新加载数据，由子类重写 */
- (void)reloadData{
    
}

@end
