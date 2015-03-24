//
//  ListCell.h
//  CSTTableview
//
//  Created by liuxin on 15/1/31.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell
+ (UINib *)nib;

@property (strong, nonatomic) IBOutlet UILabel *cellLabel;

@end
