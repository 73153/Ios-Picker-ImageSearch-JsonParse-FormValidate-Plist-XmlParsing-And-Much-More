//
//  ListCell.m
//  CSTTableview
//
//  Created by liuxin on 15/1/31.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell
+ (UINib *)nib
{
    return [UINib nibWithNibName:@"ListCell" bundle:nil];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
