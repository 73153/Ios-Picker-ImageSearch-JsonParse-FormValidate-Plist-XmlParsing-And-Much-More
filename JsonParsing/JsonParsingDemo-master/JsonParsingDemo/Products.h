//
//  Products.h
//  JsonParsingDemo
//
//  Created by Harish Kanojiya on 2/20/14.
//  Copyright (c) 2014 Florence Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Products : UIViewController
{
    //An Array to hold all Products Image Names
    NSMutableArray * arr_ProductImage;
    
    //An Array to Hold All Products Names
    NSMutableArray * arr_ProductNames;
    
    //An Array to Hold Product Description
    NSMutableArray * arr_ProductDescription;

}

//Table View to display all products information
@property (strong, nonatomic) IBOutlet UITableView *tableView_Products;

@end
