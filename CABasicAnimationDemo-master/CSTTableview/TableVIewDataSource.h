//
//  TableVIewDataSource.h
//  CSTTableview
//
//  Created by liuxin on 15/1/31.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface TableVIewDataSource : NSObject<UITableViewDataSource>

- (id)initWithItems:(NSArray *)Items cellIdentifier:(NSString *)Identifier configureCellBlock:(TableViewCellConfigureBlock)ConfigureBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
