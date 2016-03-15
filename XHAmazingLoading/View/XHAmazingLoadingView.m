//
//  XHAmazingLoadingView.m
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHAmazingLoadingView.h"
#import "XHAmazingLoadingMusicsAnimation.h"
#import "XHAmazingLoadingStarAnimation.h"
#import "XHAmazingLoadingSkypeAnimation.h"

#define kXHAmazingLoadingDefaultSize 60.0f
#define kXHAmazingLoadingDefaultTintColor [UIColor colorWithRed:0.049 green:0.849 blue:1.000 alpha:1.000]

@interface XHAmazingLoadingView ()

@property (nonatomic, strong) CABasicAnimation *fadeOutAnimation;

@end

@implementation XHAmazingLoadingView

#pragma mark - Life Cycle

- (id)initWithType:(XHAmazingLoadingAnimationType)type {
    return [self initWithType:type loadingTintColor:kXHAmazingLoadingDefaultTintColor size:kXHAmazingLoadingDefaultSize];
}

- (id)initWithType:(XHAmazingLoadingAnimationType)type loadingTintColor:(UIColor *)loadingTintColor {
    return [self initWithType:type loadingTintColor:loadingTintColor size:kXHAmazingLoadingDefaultSize];
}

- (id)initWithType:(XHAmazingLoadingAnimationType)type loadingTintColor:(UIColor *)loadingTintColor size:(CGFloat)size {
    self = [super init];
    if (self) {
        _type = type;
        _size = size;
        _loadingTintColor = loadingTintColor;
        _backgroundTintColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - Setup Methods

- (void)setupAnimation {
    self.layer.sublayers = nil;
    
    id <XHAmazingLoadingAnimationProtocol> animation = [XHAmazingLoadingView amazingLoadingAnimationForAnimationType:self.type];
    
    [self setupAmazingLoadingSizeWithAnimationType:self.type];
    
    // 检验遵守协议的对象是否实现了协议方法
    if ([animation respondsToSelector:@selector(configureAnimationInLayer:withSize:tintColor:)]) {
        [self setupFadeOutState];
        [animation configureAnimationInLayer:self.layer withSize:CGSizeMake(self.size, self.size) tintColor:self.loadingTintColor];
    }
}

- (void)setupNormalState {
    self.layer.backgroundColor = self.backgroundTintColor.CGColor;
    self.layer.speed = 1.0f;
    self.layer.opacity = 1.0;
}

- (void)setupFadeOutState {
    self.layer.backgroundColor = [UIColor clearColor].CGColor;
    self.layer.sublayers = nil;
    self.layer.speed = 0.0;
}

- (void)setupAmazingLoadingSizeWithAnimationType:(XHAmazingLoadingAnimationType)type {
    switch (type) {
        case XHAmazingLoadingAnimationTypeMusic:
            self.size = kXHAmazingLoadingDefaultSize;
            break;
        case XHAmazingLoadingAnimationTypeStar:
            self.size = 200;
            break;
        case XHAmazingLoadingAnimationTypeSkype:
            self.size = 150;
            break;
        default:
            break;
    }
}

#pragma mark - Public Methods

- (void)startAnimating {
    if (_animating) {
        return;
    }
    if (!self.layer.sublayers) {
        [self setupAnimation];
    }
    
    [self setupNormalState];
    
    _animating = YES;
}

- (void)stopAnimating {
    if (!_animating) {
        return;
    }
    
    [self.layer addAnimation:self.fadeOutAnimation forKey:@"fadeOutAnimation"];
    
    _animating = NO;
}

#pragma mark - Propertys

#pragma mark - Setters

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    NSAssert(NO, @"请不要设置View的背景颜色，请使用setBackgroundTintColor:方法");
}

#pragma mark Getters

- (CABasicAnimation *)fadeAnimationWithOpacity:(CGFloat)opacity {
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.beginTime = CACurrentMediaTime();
    fadeAnimation.duration = 0.35;
    fadeAnimation.toValue = @(opacity);
    return fadeAnimation;
}

- (CABasicAnimation *)fadeOutAnimation {
    if (!_fadeOutAnimation) {
        _fadeOutAnimation = [self fadeAnimationWithOpacity:0.0];
        _fadeOutAnimation.delegate = self;
    }
    return _fadeOutAnimation;
}

+ (id <XHAmazingLoadingAnimationProtocol>)amazingLoadingAnimationForAnimationType:(XHAmazingLoadingAnimationType)type {
    switch (type) {
        case XHAmazingLoadingAnimationTypeStar:
            return [[XHAmazingLoadingStarAnimation alloc] init];
        case XHAmazingLoadingAnimationTypeMusic:
            return [[XHAmazingLoadingMusicsAnimation alloc] init];
        case XHAmazingLoadingAnimationTypeSkype:
            return [[XHAmazingLoadingSkypeAnimation alloc] init];
    }
    return nil;
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CABasicAnimation *)animation finished:(BOOL)flag {
    [self setupFadeOutState];
}

@end
