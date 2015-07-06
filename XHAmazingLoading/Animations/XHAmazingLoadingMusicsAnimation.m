//
//  XHAmazingLoadingMusicsAnimation.m
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import "XHAmazingLoadingMusicsAnimation.h"

#import "XHLayerHelper.h"

@implementation XHAmazingLoadingMusicsAnimation

- (void)configureAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor {
    // 1.我们先初始化CAReplicatorLayer，添加到View的layer上
    // 2.再给CAReplicatorLayer添加一个上下移动的矩形layer
    // 3.然后根据CAReplicatorLayer的特性，可以进行复制、延迟动画、以什么形式进行复制
    
    
    // 这个动画的来源：http://www.ios-animations-by-emails.com/posts/2015-march#tutorial
    CGRect replicatorLayerFrame = [XHLayerHelper initializerFrameWithSize:size];
    CAReplicatorLayer *replicatorLayer = [XHLayerHelper addReplicatorLayerWithFrame:replicatorLayerFrame atLayer:layer];
    
    // 核心代码
    [self addAnimationRectangleLayerAtLayer:replicatorLayer withSize:size tintColor:tintColor];
    replicatorLayer.instanceCount = 3;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20.0, 0.0, .0);
    replicatorLayer.instanceDelay = 0.2;
    replicatorLayer.masksToBounds = YES;
}

- (void)addAnimationRectangleLayerAtLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor {
    CGFloat width = 8.0;
    CGFloat height = 40.0;
    CALayer *animationRectangleLayer = [CALayer layer];
    animationRectangleLayer.bounds = CGRectMake(0, 0, width, height);
    animationRectangleLayer.position = CGPointMake((size.width - 16 - (width * 3)) / 2.0, size.height + 15);
    animationRectangleLayer.cornerRadius = 2.0;
    animationRectangleLayer.backgroundColor = tintColor.CGColor;
    [layer addSublayer:animationRectangleLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.toValue = @(animationRectangleLayer.position.y - 35);
    animation.duration = 0.4;
    animation.autoreverses = YES;
    animation.repeatCount = CGFLOAT_MAX;
    
    [animationRectangleLayer addAnimation:animation forKey:nil];
}

@end
