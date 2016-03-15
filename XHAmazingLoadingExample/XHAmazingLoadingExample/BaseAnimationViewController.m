//
//  BaseAnimationViewController.m
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/8.
//  Copyright (c) 2015年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "BaseAnimationViewController.h"

@interface BaseAnimationViewController ()

@end

@implementation BaseAnimationViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.loadingTintColor = [UIColor redColor];
    self.backgroundTintColor = [UIColor whiteColor];
    
    self.delayTime = 2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    XHAmazingLoadingView *amazingLoadingView = [[XHAmazingLoadingView alloc] initWithType:self.amazingLoadingAnimationType];
    amazingLoadingView.loadingTintColor = self.loadingTintColor;
    amazingLoadingView.backgroundTintColor = self.backgroundTintColor;
    amazingLoadingView.frame = self.view.bounds;
    [self.view addSubview:amazingLoadingView];
    
    [amazingLoadingView startAnimating];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [amazingLoadingView stopAnimating];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [amazingLoadingView startAnimating];
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
