//
//  NSString+Validations.h
//  PakWheels
//
//  Created by Haroon Ur Rasheed on 09/01/2014.
//  Copyright (c) 2014 Confiz Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validations)

//-(BOOL)isValidAdditionalInfo;



-(BOOL)isValidTextWithRegex:(NSString*)regex;

-(BOOL)isValidDefault;
-(BOOL)isValidEmail;
-(BOOL)isValidPhoneNo;
-(BOOL)isValidDigits;
-(BOOL)isValidNumbers;

@end
