//
//  Hr_DetailViewController.m
//  FormValidationApi
//
//  Created by Haroon Ur Rasheed on 14/12/2013.
//  Copyright (c) 2013 Haroon Ur Rasheed. All rights reserved.
//

#import "Hr_DetailViewController.h"

@interface Hr_DetailViewController ()
- (void)configureView;
@end

@implementation Hr_DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
