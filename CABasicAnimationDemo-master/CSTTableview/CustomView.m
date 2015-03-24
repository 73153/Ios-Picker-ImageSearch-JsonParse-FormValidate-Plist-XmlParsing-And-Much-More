//
//  CustomView.m
//  CSTTableview
//
//  Created by liuxin on 15/2/3.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1.0);
    CGContextSetLineWidth(context, 2.f);
    CGContextAddArc(context, 80, 80, 60, 0, 2*M_PI, 0);
    CGContextDrawPath(context, kCGPathStroke);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
