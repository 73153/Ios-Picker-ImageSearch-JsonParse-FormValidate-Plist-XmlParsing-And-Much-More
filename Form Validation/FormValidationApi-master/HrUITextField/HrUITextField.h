//
//  HrUITextField.h
//  FormValidationApi
//
//  Created by Haroon Ur Rasheed on 14/12/2013.
//  Copyright (c) 2013 Haroon Ur Rasheed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+Validations.h"
typedef NS_ENUM(NSInteger, TextType) {

    TextTypeDefault=0,
    TextTypeEmailAddress,
    TextTypePhoneNo,
    TextTypeNumbers,
    TextTypeDigits,

};



@interface HrUITextField : UITextField
{

   // BOOL isValid;

}

@property (nonatomic,strong) NSString *customErrorMessage;

@property (nonatomic) BOOL isRequired;

@property (nonatomic) NSInteger minLength;
@property (nonatomic) NSInteger maxLength;

@property (nonatomic) TextType textType;

@property (nonatomic) BOOL enableInvalidColor;

@property (nonatomic,strong)NSString *customRegex;

-(BOOL)isValidText:(NSString**)error;
-(void)resetGUI;
-(BOOL)validateTextField:(HrUITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
@end
