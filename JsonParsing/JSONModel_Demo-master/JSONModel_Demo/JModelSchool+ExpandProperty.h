//
//  JModelSchool+ExpandProperty.h
//  JSONModel_Demo
//
//  Created by WeiHan on 10/17/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import "JModelSchool.h"

//#define EXPAND_PROPERTY     1

@interface JModelSchool (ExpandProperty)

#if EXPAND_PROPERTY
@property (nonatomic, strong) NSString *DescNotes;
#endif

@end
