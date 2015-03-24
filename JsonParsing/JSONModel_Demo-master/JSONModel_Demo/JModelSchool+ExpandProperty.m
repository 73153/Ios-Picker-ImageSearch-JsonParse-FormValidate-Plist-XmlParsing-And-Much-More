//
//  JModelSchool+ExpandProperty.m
//  JSONModel_Demo
//
//  Created by WeiHan on 10/17/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import "JModelSchool+ExpandProperty.h"
#import <objc/runtime.h>


@implementation JModelSchool (ExpandProperty)

#if EXPAND_PROPERTY

// Both A and B work well.
#if A
static void * DescNotesPropertyKey = &DescNotesPropertyKey;

- (NSString *)DescNotes {
    return objc_getAssociatedObject(self, DescNotesPropertyKey);
}

- (void)setDescNotes:(NSString *)desc {
    int ia = 0;
    (void)ia;
    objc_setAssociatedObject(self, DescNotesPropertyKey, desc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#else // B

- (NSString *)DescNotes {
    return objc_getAssociatedObject(self, @selector(DescNotes));
}

- (void)setDescNotes:(NSString *)desc {
    objc_setAssociatedObject(self, @selector(DescNotes), desc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#endif // A
#endif // EXPAND_PROPERTY
@end
