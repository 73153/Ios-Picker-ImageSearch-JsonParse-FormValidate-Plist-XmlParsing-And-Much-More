//
//  JModelTeacher.h
//  JSONModel_Demo
//
//  Created by WeiHan on 10/16/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import "JSONModel.h"

@class JModelInterest;

@protocol JModelInterest <NSObject>
@end


@interface JModelTeacher : JSONModel

@property (nonatomic, strong) NSString* ID;
@property (nonatomic, strong) NSString* Name;
@property (nonatomic, strong) NSString* Address;
@property (nonatomic, strong) NSString* Subject;
@property (nonatomic, strong) NSString<Ignore>* Note;

//@property (nonatomic, strong) JModelInterest<Optional>* Interests;
@property (nonatomic, strong) JModelInterest* Interests;
//@property (nonatomic, strong) NSArray<JModelInterest>* Interests;

@end


@interface JModelInterest : JSONModel

@property (nonatomic, assign) int InterestID;
@property (nonatomic, strong) NSString* InterestName;
@property (nonatomic, strong) NSString<Optional>* Category;

@end
