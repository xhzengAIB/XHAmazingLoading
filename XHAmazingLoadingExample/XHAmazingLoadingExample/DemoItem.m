//
//  DemoItem.m
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import "DemoItem.h"

@implementation DemoItem

+ (instancetype)initalizerWithTitle:(NSString *)title
                          className:(NSString *)className {
    DemoItem *item = [[DemoItem alloc] init];
    item.title = title;
    item.className = className;
    
    return item;
}

@end
