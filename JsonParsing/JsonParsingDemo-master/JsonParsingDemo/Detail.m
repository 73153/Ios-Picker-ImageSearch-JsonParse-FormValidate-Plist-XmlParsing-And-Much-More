//
//  Detail.m
//  JsonParsingDemo
//
//  Created by Harish Kanojiya on 2/20/14.
//  Copyright (c) 2014 Florence Technology. All rights reserved.
//

#import "Detail.h"

@interface Detail ()

@end

@implementation Detail

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
	
    //To Hold Image data
    imageData =[[NSMutableData alloc]init];
    
    
    //Url Of Image
    NSURL * UrlImage=[NSURL URLWithString:ImageName];
    
    //AN Asynch request to server for Image
    urlRequest =[[NSURLRequest alloc]initWithURL:UrlImage];
    
    
    //Connection To get Images from Server
    urlConnection=[NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
    
    //Start Connection to get Images
    [urlConnection start];
    
    
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    //Append Image Data received from server
    [imageData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    //Set Image View
    _imageView.image=[UIImage imageWithData:imageData];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
