//
//  Detail.h
//  JsonParsingDemo
//
//  Created by Harish Kanojiya on 2/20/14.
//  Copyright (c) 2014 Florence Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString * ImageName;
@interface Detail : UIViewController<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{

    
    //To establist Asyn Connection with server
    NSURLConnection * urlConnection;
    NSURLRequest * urlRequest;
    
    //To store Image data fetched from server
    NSMutableData * imageData;
}


@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
