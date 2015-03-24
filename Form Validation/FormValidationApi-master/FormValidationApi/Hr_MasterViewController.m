//
//  Hr_MasterViewController.m
//  FormValidationApi
//
//  Created by Haroon Ur Rasheed on 14/12/2013.
//  Copyright (c) 2013 Haroon Ur Rasheed. All rights reserved.
//

#import "Hr_MasterViewController.h"

#import "Hr_DetailViewController.h"

@interface Hr_MasterViewController () {
    
}
@end

@implementation Hr_MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

-(void)viewDidLoad{

    [super viewDidLoad];
    
    
    self.textFieldEmail.textType=TextTypeEmailAddress;
    self.textFieldEmail.maxLength=255;
    self.textFieldEmail.isRequired=YES;
    self.textFieldEmail.customErrorMessage = @"you have entered wronge email address";
    
    [self.tfContainer enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(HrUITextField *obj, NSUInteger idx, BOOL *stop) {
        
        obj.enableInvalidColor = YES;
    }];
    

}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self resignFirstResponder];

}

- (IBAction)submit:(id)sender {
    
    NSString *error;
    
    if ([self.textFieldEmail isValidText:&error]) {
        // do something
    }
    
    BOOL isValid;
    
    for (HrUITextField *tf in self.tfContainer) {
        isValid=[tf isValidText:&error];
    }
    
    if (!isValid) {
        return;
    }
    
}

#pragma mark TextField Delegates



-(BOOL)textField:(HrUITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    return [textField validateTextField:textField shouldChangeCharactersInRange:range replacementString:string];
}




-(void)textFieldDidBeginEditing:(HrUITextField *)textField{
    
    [textField resetGUI];
    
}

@end
