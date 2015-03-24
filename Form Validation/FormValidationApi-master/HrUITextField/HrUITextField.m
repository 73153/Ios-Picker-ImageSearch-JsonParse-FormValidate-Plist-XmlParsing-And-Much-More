//
//  HrUITextField.m
//  FormValidationApi
//
//  Created by Haroon Ur Rasheed on 14/12/2013.
//  Copyright (c) 2013 Haroon Ur Rasheed. All rights reserved.
//

#import "HrUITextField.h"

#define UIColorWithRGB(Red,Green,Blue) [UIColor colorWithRed:Red/255.0f green:Green/255.0f blue:Blue/255.0f alpha:1.0f];

#define validUIColor UIColorWithRGB(204.0f,204.0f,153.0f)
#define inValidUIColor [UIColor redColor]


static UIView *popUpView=Nil;

@interface HrUITextField ()

{

    BOOL isValidTextLengthDefined;
    



}

@property (nonatomic,strong) NSString *defaultErrorMessage;
@end


@implementation HrUITextField

-(void)setDefaultErrorMessage:(NSString *)defaultErrorMessage{

    _defaultErrorMessage = self.customErrorMessage?:defaultErrorMessage;

}


-(void)awakeFromNib{

    
    
    
    
    if (self.minLength<0)
        self.minLength=0;
    
   
    if (self.maxLength<0){
        self.maxLength=0;
    
    }else{
    
        isValidTextLengthDefined=YES;
    }
    
    
    //isValid=!self.isRequired;
    //self.delegate=self;
}


-(id)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        if (self.minLength<0)
            self.minLength=0;
        
        
        if (self.maxLength<0){
            self.maxLength=0;
            
        }else{
            
            isValidTextLengthDefined=YES;
        }
        
        
        //isValid=!self.isRequired;
        //self.delegate=self;
    }
    
    return self;

}

-(BOOL)isValidText:(NSString**)error{

    
    //inValidMessage;
    [self resignFirstResponder];
    [self removePopUP];
    
    
    if ((self.isRequired&&![self.text length]))
    {
    
        if ([self.placeholder isEqualToString:@"Please provide your email address"]) {
            
            *error=self.placeholder;
            
        }
        else
        {
            *error=[NSString stringWithFormat:@"%@ is required.",self.placeholder];
        }
        //NSLog(@"This value is required.");
        self.defaultErrorMessage = *error;
        [self initInvalidTextField];
        
        return FALSE;
    
    }

    if (self.text.length<self.minLength) {
        
        *error=[NSString stringWithFormat:@"%@ length should be greater than or equal to %ld.",self.placeholder,(long)self.minLength];
        
       // NSLog(@"This value should be greater than or equal to %d.",self.minLength);
        
        [self initInvalidTextField];
        self.defaultErrorMessage = *error;
        return FALSE;
    }
    
    
   
    BOOL isValid = [self validateText];
  
    if (!isValid) {
        
        *error=[NSString stringWithString:[self getInValidMessage]];
        self.defaultErrorMessage = *error;
        NSLog(@"%@",[self getInValidMessage]);
        
        [self initInvalidTextField];
    }
    
    return isValid;
    
}


-(void)resetGUI{
    
    if (!self.enableInvalidColor)
        return;
    
    self.backgroundColor=validUIColor;
    
    UIButton * btn = (UIButton*)[self viewWithTag:1];
    if (btn) {
        [btn removeFromSuperview];
    }

}

-(void)initInvalidTextField{
    
    
    
    if (self.backgroundColor==inValidUIColor || !self.enableInvalidColor)
        return;
    
    
    self.backgroundColor=inValidUIColor;
    
    CGRect frame;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoDark];

    frame=btn.frame;
    
    
    frame.origin.x=self.frame.size.width-frame.size.width;
    frame.origin.y=self.frame.size.height*0.2;
    
    btn.frame=frame;
    
    [btn addTarget:self action:@selector(showPopUp) forControlEvents:UIControlEventTouchUpInside];
    
    btn.tag=1;
    
    [self addSubview:btn];
    
    
    
    
}

-(void)removePopUP{

    if (popUpView) {
        [popUpView removeFromSuperview];
        popUpView=Nil;
    }
    
}

-(void)showPopUp{
    
    CGRect mainView = [UIScreen mainScreen].bounds;
    
    [self removePopUP];
   
    
    popUpView = [[UIView alloc] initWithFrame:CGRectMake(0,mainView.size.height,mainView.size.width,40)];
    
    popUpView.backgroundColor=[UIColor lightGrayColor];
    
    
    UILabel *lbErrorMessage = [[UILabel alloc] initWithFrame:CGRectMake(0,0,mainView.size.width,40)];
    
    lbErrorMessage.textAlignment=NSTextAlignmentCenter;
    
    lbErrorMessage.text=self.defaultErrorMessage;
    
    lbErrorMessage.font=[UIFont systemFontOfSize:15.0f];
    
    [popUpView addSubview:lbErrorMessage];
    
    [self.superview addSubview:popUpView];
    
    
    CGRect frame = popUpView.frame;
    
    
    frame.origin.y=mainView.size.height-frame.size.height;
    
    [UIView animateWithDuration:0.5
                          delay:0.2
                        options:0
                     animations:^{
                         popUpView.frame=frame;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];

}

-(NSString *)getInValidMessage{

    if ([self.placeholder isEqualToString:@"Please provide your email address"]) {
        
        return @"Email address seems to be invalid.";
        
    }
    else
    {
        return [NSString stringWithFormat:@"%@ seems to be invalid.",self.placeholder];
    }

   
//    switch (self.textType) {
//        case TextTypeDefault:
//            return [NSString stringWithFormat:@"%@ seems to be invalid.",self.placeholder];
//        case TextTypeEmailAddress:
//            return [NSString stringWithFormat:@"%@ seems to be invalid.",self.placeholder];
//        case TextTypeDigits:
//            return @"This value should be digits.";
//        case TextTypeNumbers:
//            return @"This value should be a valid number.";
//        case TextTypePhoneNo:
//            return @"This value should be a valid phone number.";
//        default:
//            break;
//    }

}

//-(NSString *)getRegex{
//
//    if (self.customRegex)
//        return self.customRegex;
//    
//    switch (self.textType) {
//        case TextTypeDefault:
//           return @".*";
//        case TextTypeEmailAddress:
//            return @"^([^@\\s]+)@((?:[-a-z0-9]+\\.)+[a-z]{2,})$";
//        case TextTypeDigits:
//            return @"^\\d+$";
//        case TextTypeNumbers:
//            return @"^-?(?:\\d+|\\d{1,3}(?:,\\d{3})+)?(?:\\.\\d+)?$";
//        case TextTypePhoneNo:
//            return @"^03\\d{9}$";
//        
//            
//        default:
//            break;
//    }
//
//
//}


-(BOOL)validateText{

    if (self.customRegex)
        return [self.text isValidTextWithRegex:self.customRegex];
    
    switch (self.textType) {
        case TextTypeDefault:
            return [self.text isValidDefault];
        case TextTypeEmailAddress:
            return [self.text isValidEmail];
        case TextTypeDigits:
            return [self.text isValidDigits];;
        case TextTypeNumbers:
            return [self.text isValidNumbers];;
        case TextTypePhoneNo:
            return [self.text isValidPhoneNo];;
            
            
        default:
            break;
    }

}


-(BOOL)validateTextField:(HrUITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    if (!isValidTextLengthDefined) {
        
        NSLog(@"Text Maxlength should be greater then 0");
        return YES;
    }
    
    
    
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    
    if (returnKey) [self resignFirstResponder];
    
    return newLength <= textField.maxLength || returnKey;
}

//#pragma mark TextField Delegates
//
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//
//    if (!isValidTextLengthDefined) {
//        
//        NSLog(@"Text Maxlength should be greater then 0");
//        return YES;
//    }
//    
////    if (self.keyboardType==UIKeyboardTypeNumberPad) {
////        [self changeNumberFormate:self.text];
////    }
//    
//    NSUInteger oldLength = [textField.text length];
//    NSUInteger replacementLength = [string length];
//    NSUInteger rangeLength = range.length;
//    
//    NSUInteger newLength = oldLength - rangeLength + replacementLength;
//    
//    BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
//    
//    if (returnKey) [self resignFirstResponder];
//    
//    return newLength <= self.maxLength || returnKey;
//}
//
//
//
//
//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//
//    [self reset];
//    
//}
//
//-(void)textFieldDidEndEditing:(UITextField *)textField{
//
//}

@end
