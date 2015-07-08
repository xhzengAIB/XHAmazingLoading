//
//  XHAmazingLoadingSkypeAnimation.m
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/8.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import "XHAmazingLoadingSkypeAnimation.h"

@interface XHAmazingLoadingSkypeAnimation ()

@property (nonatomic, assign) CGSize bubbleSize;
@property (nonatomic, assign) CGSize size;

@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, assign) NSTimeInterval timeInterval;

@end

@implementation XHAmazingLoadingSkypeAnimation

- (void)configureAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor {
    // 动画效果来源:https://github.com/stefanceriu/SCSkypeActivityIndicatorView
    
    self.layer = layer;
    self.size = size;
    
    for (NSUInteger i = 0; i < 5; i++) {
        CGFloat x = i * (1.0f / 5);
        
        [self bubbleWithTimingFunction:[CAMediaTimingFunction functionWithControlPoints:0.5f :(0.1f + x) :0.25f :1.0f]
                          initialScale:1.0f - x
                            finalScale:0.2f + x
                             tintColor:tintColor
                               atLayer:layer];
    }

}

- (NSTimeInterval)timeInterval {
    return 1.5f;
}

- (CGSize)bubbleSize {
    return CGSizeMake(self.size.width / 10.0f, self.size.width / 10.0f);
}

- (CALayer *)bubbleWithTimingFunction:(CAMediaTimingFunction *)timingFunction initialScale:(CGFloat)initialScale finalScale:(CGFloat)finalScale tintColor:(UIColor *)tintColor atLayer:(CALayer *)layer {
    CALayer *bubbleLayer = [CALayer layer];
    bubbleLayer.frame = CGRectMake(0, 0, self.bubbleSize.width, self.bubbleSize.height);
    bubbleLayer.cornerRadius = CGRectGetMidX(bubbleLayer.frame);
    bubbleLayer.masksToBounds = YES;
    bubbleLayer.backgroundColor = tintColor.CGColor;
    [layer addSublayer:bubbleLayer];
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.duration = self.timeInterval;
    pathAnimation.repeatCount = CGFLOAT_MAX;
    pathAnimation.timingFunction = timingFunction;
    pathAnimation.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.layer.frame.size.width/2, self.layer.frame.size.height/2)
                                                        radius:MIN(self.size.width - bubbleLayer.bounds.size.width, self.size.width - bubbleLayer.bounds.size.height)/2
                                                    startAngle:3 * M_PI / 2
                                                      endAngle:3 * M_PI / 2 + 2 * M_PI
                                                     clockwise:YES].CGPath;
    
    [bubbleLayer addAnimation:pathAnimation forKey:nil];
    
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = self.timeInterval;
    scaleAnimation.repeatCount = CGFLOAT_MAX;
    scaleAnimation.fromValue = @(initialScale);
    scaleAnimation.toValue = @(finalScale);
    
    if(initialScale > finalScale) {
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    } else {
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    }
    
    [bubbleLayer addAnimation:scaleAnimation forKey:nil];
    
    return bubbleLayer;
}

@end
