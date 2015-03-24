//
//  ViewController.h
//  JsonRequestLearn
//
//  Created by hackintosh on 2014/7/7.
//  Copyright (c) 2014年 cxx4c7tn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *jsonURL;
@property (weak, nonatomic) IBOutlet UITextField *key;
@property (weak, nonatomic) IBOutlet UITextField *value;
- (IBAction)get:(id)sender;

@end
