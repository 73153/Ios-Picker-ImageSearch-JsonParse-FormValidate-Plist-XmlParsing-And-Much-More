//
//  Hr_DetailViewController.h
//  FormValidationApi
//
//  Created by Haroon Ur Rasheed on 14/12/2013.
//  Copyright (c) 2013 Haroon Ur Rasheed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Hr_DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
