//
//  NoNetworkView.h
//  NoNetworkView
//
//  Created by honyork on 2016/11/9.
//  Copyright © 2016年 HuaJianCi. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CheckNetworkDelegate <NSObject>
@optional

/** 重新加载数据 */
- (void)reloadData;

@end
@interface NoNetworkView : UIView

@property (nonatomic,weak) id<CheckNetworkDelegate> delegate;

@end
