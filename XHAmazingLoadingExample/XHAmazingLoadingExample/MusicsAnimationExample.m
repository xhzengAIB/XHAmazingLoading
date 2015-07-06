//
//  MusicsAnimationExample.m
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import "MusicsAnimationExample.h"
#import "XHAmazingLoadingView.h"

@implementation MusicsAnimationExample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    XHAmazingLoadingView *amazingLoadingView = [[XHAmazingLoadingView alloc] initWithType:XHAmazingLoadingAnimationTypeMusic];
    amazingLoadingView.loadingTintColor = [UIColor redColor];
    amazingLoadingView.backgroundTintColor = [UIColor whiteColor];
    amazingLoadingView.frame = self.view.bounds;
    [self.view addSubview:amazingLoadingView];
    
    [amazingLoadingView startAnimating];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [amazingLoadingView stopAnimating];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [amazingLoadingView startAnimating];
        });
    });
}

@end
