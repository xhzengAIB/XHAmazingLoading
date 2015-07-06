//
//  XHLayerHelper.h
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XHLayerHelper : NSObject

+ (void)addTextLayerWithText:(NSString *)text atLayer:(CALayer *)layer;

+ (CAReplicatorLayer *)addReplicatorLayerWithFrame:(CGRect)frame atLayer:(CALayer *)layer;

+ (CGRect)initializerFrameWithSize:(CGSize)size;

@end
