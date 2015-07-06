//
//  RootTableViewController.m
//  XHAmazingLoadingExample
//
//  Created by Jack_iMac on 15/7/6.
//  Copyright (c) 2015年 com.HUAJIE. All rights reserved.
//

#import "RootTableViewController.h"

#import "DemoItem.h"

#define kRootItems \
@[ \
@{@"title" : @"音乐跳动", @"className" : @"MusicsAnimationExample"}, \
@{@"title" : @"星星", @"className" : @"StarAnimationExample"}, \
]

@interface RootTableViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"疯狂Loading";
    
    NSMutableArray *dataSource = [[NSMutableArray alloc] init];
    [kRootItems enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
        [dataSource addObject:[DemoItem initalizerWithTitle:obj[@"title"] className:obj[@"className"]]];
    }];
    self.dataSource = dataSource;
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    DemoItem *item = self.dataSource[indexPath.row];
    cell.textLabel.text = item.title;
    
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DemoItem *item = self.dataSource[indexPath.row];
    
    Class currentClass = NSClassFromString(item.className);
    UIViewController *viewController = [[currentClass alloc] init];
    viewController.title = item.title;
    if (viewController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
