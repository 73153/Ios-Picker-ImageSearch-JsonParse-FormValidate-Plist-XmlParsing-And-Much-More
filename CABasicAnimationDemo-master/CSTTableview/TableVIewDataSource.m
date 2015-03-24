//
//  TableVIewDataSource.m
//  CSTTableview
//
//  Created by liuxin on 15/1/31.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import "TableVIewDataSource.h"

@interface TableVIewDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) TableViewCellConfigureBlock cellBlock;
@property (nonatomic, strong) NSString *identifier;

@end
@implementation TableVIewDataSource

- (id)init
{
    return nil;
}
- (id)initWithItems:(NSArray *)Items cellIdentifier:(NSString *)Identifier configureCellBlock:(TableViewCellConfigureBlock)ConfigureBlock
{
    self = [super init];
    if (self) {
        self.items = Items;
        self.identifier = Identifier;
        self.cellBlock = [ConfigureBlock copy];
    }
    
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[indexPath.row];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.cellBlock(cell,item);
    return cell;
}
@end
