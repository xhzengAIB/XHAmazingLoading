//
//  DemoItem.h
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *className;

+ (instancetype)initalizerWithTitle:(NSString *)title
                          className:(NSString *)className;

@end
