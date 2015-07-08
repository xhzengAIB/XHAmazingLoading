//
//  SkypeAnimationExample.m
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/8.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import "SkypeAnimationExample.h"

@interface SkypeAnimationExample ()

@end

@implementation SkypeAnimationExample

- (instancetype)init {
    self = [super init];
    if (self) {
        self.amazingLoadingAnimationType = XHAmazingLoadingAnimationTypeSkype;
        
        self.loadingTintColor = [UIColor whiteColor];
        self.backgroundTintColor = [UIColor colorWithRed:0.108 green:0.658 blue:0.906 alpha:1.000];
    }
    return self;
}


@end
