//
//  GlobalTestEntry.m
//  JSONModel_Demo
//
//  Created by WeiHan on 10/16/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import "GlobalTestEntry.h"
#import "JModelSchool.h"
#import "JModelTeacher.h"
#import <JSONModel/JSONModel.h>

#import "JModelSchool+ExpandProperty.h"

@implementation GlobalTestEntry

+ (void)testEntry
{
//    NSDictionary *teacherDict = @{@"ID": @"111",
//                                  @"Name": @"teacherName1",
//                                  @"Address": @"teacher's home address",
//                                  @"Subject": @"IT",
//                                  @"Note": @"reserved notes",
//                                  @"Interests": [NSNull null]};
    
    NSDictionary *teacherDict = @{@"ID": @"111",
                                  @"Name": @"teacherName1",
                                  @"Address": @"teacher's home address",
                                  @"Subject": @"IT",
                                  @"Note": @"reserved notes",
                                  @"Interests": @{@"InterestID": @1111,
                                                  @"InterestName": @"Naruto",
                                                  @"Category": @"Anime"}};
    
//    NSDictionary *schoolDict = @{@"ID": @"001",
//                                 @"Name": @"schoolName1",
//                                 @"Address": @"beijing, china",
//                                 @"Teacher": [NSNull null]};
    NSDictionary *schoolDict = @{@"ID": @"001",
                                 @"Name": @"schoolName1",
                                 @"Address": @"beijing, china",
                                 @"Teacher": teacherDict};
    
    [self validateExpandCategory];
    [self serializeTeacher:teacherDict];
    [self serializeSchool:schoolDict];
}

+ (void)validateExpandCategory
{
#if EXPAND_PROPERTY
    JModelSchool *newSchool = [[JModelSchool alloc] init];
    
    NSLog(@"desc: %@", newSchool.DescNotes);
    newSchool.DescNotes = @"new descriptions";
    [newSchool setDescNotes:@"new desc"];
    NSLog(@"desc: %@", newSchool.DescNotes);
#endif
}

+ (void)serializeSchool:(NSDictionary *)dict
{
    NSError *err;
    JModelSchool *school = [[JModelSchool alloc] initWithDictionary:dict error:&err];
    
    if (school)
        NSLog(@"school: %@", school);
    else
        NSLog(@"error: %@", err);
}

+ (void)serializeTeacher:(NSDictionary *)dict
{
    NSError *err;
    JModelTeacher *teacher = [[JModelTeacher alloc] initWithDictionary:dict error:&err];
    
    if (teacher)
        NSLog(@"teacher: %@", teacher);
    else
        NSLog(@"error: %@", err);
}

@end
