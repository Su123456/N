//
//  NoNetworkView.m
//  NoNetworkView
//
//  Created by honyork on 2016/11/9.
//  Copyright © 2016年 HuaJianCi. All rights reserved.
//

#import "NoNetworkView.h"

@implementation NoNetworkView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //界面搭建
        [self setUI];
    }
    return self;
}


- (void)setUI{
    self.backgroundColor = [UIColor whiteColor];
    
    // 404图片放中间
    UIImageView *noNetworkImageView = [UIImageView new];
    [self addSubview:noNetworkImageView];
    noNetworkImageView.image = [UIImage imageNamed:@"404notfound"];
    
    // 重新查看按钮
    UIButton *checkButton = [UIButton new];
    [self addSubview:checkButton];
    [checkButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    checkButton.backgroundColor = [UIColor colorWithRed:0.00 green:0.76 blue:0.66 alpha:1.00];
    [checkButton setTitle:@"重新查看" forState:UIControlStateNormal];
    [checkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [checkButton addTarget:self action:@selector(checkNetworkButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // 图片上面的两个label
    UILabel *label1 = [UILabel new];
    label1.text = @"刷新一下!";
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor colorWithRed:0.00 green:0.77 blue:0.68 alpha:1.00];
    label1.backgroundColor = [UIColor clearColor];
    label1.textAlignment = NSTextAlignmentCenter;
    [label1 sizeToFit];
    [self addSubview:label1];
    
    UILabel *label2 = [UILabel new];
    label2.text = @"您似乎迷路了";
    label2.font = [UIFont systemFontOfSize:19];
    label2.textColor = [UIColor colorWithRed:0.00 green:0.77 blue:0.67 alpha:1.00];
    label2.backgroundColor = [UIColor clearColor];
    label2.textAlignment = NSTextAlignmentCenter;
    [label2 sizeToFit];
    [self addSubview:label2];
    
    
    [noNetworkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.height.equalTo(@125);
    }];
    
    [checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(noNetworkImageView.mas_bottom).offset(10);
        make.width.equalTo(@115);
        make.height.equalTo(@30);
    }];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(noNetworkImageView.mas_top).offset(-10);
        make.width.equalTo(@100);
        make.height.equalTo(@20);
    }];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(label1.mas_top).offset(-10);
        make.width.equalTo(@150);
        make.height.equalTo(@20);
    }];
}

/** 重新查看按钮点击 */
- (void)checkNetworkButtonClicked{
    if ([ReachabilityViewController isConnectionAvailable]) {
        // 如果有网，view消失，并且让代理方执行代理方法
        
        [self removeFromSuperview];
        
        // 重新加载数据
        if ([self.delegate respondsToSelector:@selector(reloadData)]) {
            [self.delegate reloadData];
        }
    }else{
        // 如果没网，toast提示
        [SVProgressHUD showStatus:@"请检查你的网络连接"];
    }
}

@end
