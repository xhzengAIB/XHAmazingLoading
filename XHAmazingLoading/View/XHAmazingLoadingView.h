//
//  XHAmazingLoadingView.h
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XHAmazingLoadingAnimationType) {
    XHAmazingLoadingAnimationTypeStar,
    XHAmazingLoadingAnimationTypeMusic,
    XHAmazingLoadingAnimationTypeSkype,
};

@interface XHAmazingLoadingView : UIView

@property (nonatomic, assign) XHAmazingLoadingAnimationType type;\
@property (nonatomic, strong) UIColor *backgroundTintColor;
@property (nonatomic, strong) UIColor *loadingTintColor;
@property (nonatomic, assign) CGFloat size;

@property (nonatomic, readonly) BOOL animating;

- (id)initWithType:(XHAmazingLoadingAnimationType)type;

- (id)initWithType:(XHAmazingLoadingAnimationType)type
  loadingTintColor:(UIColor *)tintColor;

- (id)initWithType:(XHAmazingLoadingAnimationType)type
  loadingTintColor:(UIColor *)tintColor
              size:(CGFloat)size;

- (void)startAnimating;
- (void)stopAnimating;

@end
