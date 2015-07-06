//
//  StarAnimationExample.m
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import "StarAnimationExample.h"
#import "XHAmazingLoadingView.h"

@implementation StarAnimationExample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    XHAmazingLoadingView *amazingLoadingView = [[XHAmazingLoadingView alloc] initWithType:XHAmazingLoadingAnimationTypeStar];
    amazingLoadingView.loadingTintColor = [UIColor colorWithRed:0.136 green:0.767 blue:1.000 alpha:1.000];
    amazingLoadingView.backgroundTintColor = [UIColor whiteColor];
    amazingLoadingView.frame = self.view.bounds;
    [self.view addSubview:amazingLoadingView];
    
    [amazingLoadingView startAnimating];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [amazingLoadingView stopAnimating];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [amazingLoadingView startAnimating];
        });
    });
}

@end
