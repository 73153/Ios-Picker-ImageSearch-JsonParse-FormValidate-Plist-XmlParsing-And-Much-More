//
//  ScendViewController.m
//  CSTTableview
//
//  Created by liuxin on 15/2/3.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import "ScendViewController.h"
#import "CustomView.h"

@interface ScendViewController ()

@end

@implementation ScendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    CustomView *cView = [[CustomView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    cView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:cView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
