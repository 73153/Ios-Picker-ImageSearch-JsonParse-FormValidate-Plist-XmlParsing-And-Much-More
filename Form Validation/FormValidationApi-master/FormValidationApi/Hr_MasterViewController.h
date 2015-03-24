//
//  Hr_MasterViewController.h
//  FormValidationApi
//
//  Created by Haroon Ur Rasheed on 14/12/2013.
//  Copyright (c) 2013 Haroon Ur Rasheed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HrUITextField.h"

@interface Hr_MasterViewController : UIViewController

@property (weak, nonatomic) IBOutlet HrUITextField *textFieldEmail;


@property (strong, nonatomic) IBOutletCollection(HrUITextField) NSArray *tfContainer;

- (IBAction)submit:(id)sender;
@end
