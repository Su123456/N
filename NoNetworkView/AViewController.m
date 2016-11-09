//
//  AViewController.m
//  NoNetworkView
//
//  Created by honyork on 2016/11/9.
//  Copyright © 2016年 HuaJianCi. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([ReachabilityViewController isConnectionAvailable]) {
       [self setupImage];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"A页面";
}


- (void)reloadData{
    NSLog(@"A页面刷新");
    [self setupImage];
}

//相当于刷新数据
- (void)setupImage{
    // 有网加载
    [SVProgressHUD showWithStatus:@"加载数据" maskType:SVProgressHUDMaskTypeBlack];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 49)];
        imageView.clipsToBounds = true;
        imageView.image         = [UIImage imageNamed:@"a"];
        [self.view addSubview:imageView];
    });
}

@end
