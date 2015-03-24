//
//  NSString+stringToRemoveHTMLcontent.m
//  MobileRewards
//
//  Created by Harish Kanojiya on 2/9/14.
//  Copyright (c) 2014 florence. All rights reserved.
//

#import "NSString+stringToRemoveHTMLcontent.h"

@implementation NSString (stringToRemoveHTMLcontent)



-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

@end
