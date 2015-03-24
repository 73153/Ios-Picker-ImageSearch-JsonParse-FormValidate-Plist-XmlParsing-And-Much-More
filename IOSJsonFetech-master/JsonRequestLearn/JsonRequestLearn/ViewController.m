//
//  ViewController.m
//  JsonRequestLearn
//
//  Created by hackintosh on 2014/7/7.
//  Copyright (c) 2014年 cxx4c7tn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.key.delegate=self;
    self.jsonURL.delegate=self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)get:(id)sender {
    
    NSError *error;
    NSLog(@" jsonURL %@",_jsonURL.text);
    //Load an Json file With Existing URL
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.jsonURL.text]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //Put Json Object into NSDictionary
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
//    NSArray *weatherInfo = [weatherDic objectForKey:@"contents"];
//    [weatherInfo indexOfObject:0];
    self.value.text = [[NSString alloc]initWithFormat:@"%@",[weatherDic objectForKey:self.key.text]];
    NSLog(@"%@",[weatherDic objectForKey:self.key.text]);
    //NSLog(@"%@",[[weatherInfo objectAtIndex:1]objectForKey:@"productID"]);
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

// It is important for you to hide kwyboard

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
