//
//  XHAmazingLoadingAnimationProtocol.h
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol XHAmazingLoadingAnimationProtocol <NSObject>

// 抽象协议
- (void)configureAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor;

@end
