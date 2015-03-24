/***************************************************************************/
/*                                                                         */
/*  JMFFlickr.h                                                            */
/*  Copyright (c) 2014 Simarks. All rights reserved.                       */
/*                                                                         */
/*  Description: JMFCameraIOS                                              */
/*               U-Tad - Práctica iOS Avanzado                             */
/*               Flickr Search Class definition file                       */
/*                                                                         */
/*       Author: Jorge Marcos Fernandez                                    */
/*         NOTE: Modified from Brandon Trebitowski file                    */
/*                                                                         */
/***************************************************************************/
#import <Foundation/Foundation.h>
#import "JMFFlickrPhoto.h"
#import "JMFFlickrOAuth.h"
#import "JMFFlickrUpload.h"
#import "JMFFlickrUploadResponse.h"
#import "JMFUtility.h"

/***************************************************************************/
/*                                                                         */
/*                                                                         */
/*  Constants                                                              */
/*                                                                         */
/*                                                                         */
/***************************************************************************/
static NSString* kFlickrConsumerKey    = @"594def730d7175eea7deb139366585e1";
static NSString* kFlickrConsumerSecret = @"e3e3593531b25d4c";
static NSString* kSignatureMethod      = @"HMAC-SHA1";
static NSString* kOAuthVersion         = @"1.0";

/***************************************************************************/
/*                                                                         */
/*                                                                         */
/*  Typedefs                                                               */
/*                                                                         */
/*                                                                         */
/***************************************************************************/
typedef void (^FlickrPhotoCompletionBlock)( UIImage* photoImage, NSError* error );
typedef void (^FlickrSearchCompletionBlock)( NSString* searchTerm, NSArray* results, NSError* error );

/***************************************************************************/
/*                                                                         */
/*                                                                         */
/*                                                                         */
/*                                                                         */
/*  JMFFlickr Class Interface                                              */
/*                                                                         */
/*                                                                         */
/*                                                                         */
/*                                                                         */
/***************************************************************************/
@interface JMFFlickr : NSObject

/***************************************************************************/
/*                                                                         */
/*                                                                         */
/*  Class Methods                                                          */
/*                                                                         */
/*                                                                         */
/***************************************************************************/
+ (void)flickrSearchForTerm:(NSString*)term largeImage:(BOOL)bLargeImage completionBlock:(FlickrSearchCompletionBlock)completionBlock;
+ (void)loadImageForPhoto:(JMFFlickrPhoto*)flickrPhoto thumbnail:(BOOL)thumbnail completionBlock:(FlickrPhotoCompletionBlock)completionBlock;

@end