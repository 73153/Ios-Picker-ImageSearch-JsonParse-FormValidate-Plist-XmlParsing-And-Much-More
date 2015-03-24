//
//  Products.m
//  JsonParsingDemo
//
//  Created by Harish Kanojiya on 2/20/14.
//  Copyright (c) 2014 Florence Technology. All rights reserved.
//

#import "Products.h"

#import "SBJson.h"
#import "AppUrls.h"
#import "NSString+stringToRemoveHTMLcontent.h"

#import "Detail.h"
@interface Products ()

@end

@implementation Products

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //Alloc memory to arrays to hold values
    arr_ProductDescription=[[NSMutableArray alloc]init];
    arr_ProductNames=[[NSMutableArray alloc]init];
    arr_ProductImage=[[NSMutableArray alloc]init];
    
    
    //Get All Products List from server
    
    NSString * StrRequest=[NSString stringWithFormat:@"%@",url_Products];
    
    //Convert String to URL
    NSURL * UrlRequest=[NSURL URLWithString:StrRequest];
    
    
    //Get Content of Requested Url
    NSString * StrResponse=[NSString stringWithContentsOfURL:UrlRequest encoding:NSUTF8StringEncoding error:nil];
    
    
    //Convert Response Data in JSON
    NSMutableDictionary * Arr_Response=[StrResponse JSONValue];
    
    //Get All Json Response In Main Array
    NSMutableDictionary * Response=[Arr_Response valueForKey:@"data"];
    
    
    //Initialize Name and Description of Products
    arr_ProductNames=[[Response valueForKey:@"product_name"] objectAtIndex:0];
    arr_ProductDescription=[[Response valueForKey:@"product_description"] objectAtIndex:0];
    arr_ProductImage=[[Response valueForKey:@"product_image"] lastObject];
    
    
    [_tableView_Products reloadData];
    
	NSLog(@"Products=%@",arr_ProductImage);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return arr_ProductNames.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(cell==nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    
    cell.textLabel.text=[arr_ProductNames objectAtIndex:indexPath.row];
    
    NSString * des=[arr_ProductDescription objectAtIndex:indexPath.row];
    
    
    cell.detailTextLabel.text=[des stringByStrippingHTML];
    
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //Initialize selected products image path
    ImageName=[NSString stringWithFormat:@"%@/%@",url_ProductImages,[arr_ProductImage objectAtIndex:indexPath.row]];
    
    
    //Go To Next Detail screem
    [self performSegueWithIdentifier:@"seg" sender:self];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
