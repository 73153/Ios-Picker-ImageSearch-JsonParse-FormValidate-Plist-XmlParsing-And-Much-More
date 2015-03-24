//
//  JModelSchool.h
//  JSONModel_Demo
//
//  Created by WeiHan on 10/16/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import "JSONModel.h"
#import "JModelTeacher.h"

@interface JModelSchool : JSONModel

@property (nonatomic, strong) NSString* ID;
@property (nonatomic, strong) NSString* Name;
@property (nonatomic, strong) NSString* Address;
//@property (nonatomic, strong) NSString* Province;     //The additional non-optional property of entity will be caused serialization failed.
@property (nonatomic, strong) JModelTeacher<Optional>* Teacher;

@end
