//
//  NSString+Validations.m
//  PakWheels
//
//  Created by Haroon Ur Rasheed on 09/01/2014.
//  Copyright (c) 2014 Confiz Solutions. All rights reserved.
//

#import "NSString+Validations.h"

//#define kRegexAdditionalInfo @"^(?:(?![0-9]{3}[- ]*[0-9]{7})(.|\\n|\\r))*$"

@implementation NSString (Validations)


-(BOOL)isValidTextWithRegex:(NSString*)regex{
    
    
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat : @"SELF MATCHES %@", regex];
    BOOL isValid = [emailTest evaluateWithObject : self];
    return isValid;
    
    
    
}


//-(BOOL)isValidAdditionalInfo{
//    
//    return [self isValidTextWithRegex:kRegexAdditionalInfo];
//}


-(BOOL)isValidDefault{

    return [self isValidTextWithRegex:@".*"];
}

-(BOOL)isValidEmail{

    return [self isValidTextWithRegex:@"^([^@\\s]+)@((?:[-a-z0-9]+\\.)+[a-z]{2,})$"];
}

-(BOOL)isValidPhoneNo{
    
    return [self isValidTextWithRegex:@"^03\\d{9}$"];

}

-(BOOL)isValidDigits{

    return [self isValidTextWithRegex:@"^\\d+$"];
}

-(BOOL)isValidNumbers{

    return [self isValidTextWithRegex:@"^-?(?:\\d+|\\d{1,3}(?:,\\d{3})+)?(?:\\.\\d+)?$"];
}


@end
