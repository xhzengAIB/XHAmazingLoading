//
//  XHAmazingLoadingView.h
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
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
