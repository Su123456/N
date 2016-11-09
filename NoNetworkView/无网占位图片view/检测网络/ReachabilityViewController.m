//
//  ReachabilityViewController.m
//  RelaxHeart
//
//  Created by rimi on 15/5/12.
//  Copyright (c) 2015年 maxiaogang. All rights reserved.
//

#import "ReachabilityViewController.h"
#import "Reachability.h"
@interface ReachabilityViewController ()

@end

@implementation ReachabilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark -- 检测网络
+ (BOOL) isConnectionAvailable{
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    return isExistenceNetwork;
}

@end
