//
//  BaseAnimationViewController.h
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/8.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHAmazingLoadingView.h"

@interface BaseAnimationViewController : UIViewController

@property (nonatomic, assign) XHAmazingLoadingAnimationType amazingLoadingAnimationType;
@property (nonatomic, strong) UIColor *backgroundTintColor;
@property (nonatomic, strong) UIColor *loadingTintColor;

@property (nonatomic, assign) NSTimeInterval delayTime;

@end
