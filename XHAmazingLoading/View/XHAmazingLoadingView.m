//
//  XHAmazingLoadingView.m
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import "XHAmazingLoadingView.h"
#import "XHAmazingLoadingMusicsAnimation.h"
#import "XHAmazingLoadingStarAnimation.h"

#define kXHAmazingLoadingDefaultSize 60.0f
#define kXHAmazingLoadingDefaultTintColor [UIColor colorWithRed:287/255.0f green:105/255.0f blue:121/255.0f alpha:1.0f]

@implementation XHAmazingLoadingView

#pragma mark - Propertys

#pragma mark Getters

+ (id <XHAmazingLoadingAnimationProtocol>)amazingLoadingAnimationForAnimationType:(XHAmazingLoadingAnimationType)type {
    switch (type) {
        case XHAmazingLoadingAnimationTypeStar:
            return [[XHAmazingLoadingStarAnimation alloc] init];
        case XHAmazingLoadingAnimationTypeMusic:
            return [[XHAmazingLoadingMusicsAnimation alloc] init];
    }
    return nil;
}

@end
