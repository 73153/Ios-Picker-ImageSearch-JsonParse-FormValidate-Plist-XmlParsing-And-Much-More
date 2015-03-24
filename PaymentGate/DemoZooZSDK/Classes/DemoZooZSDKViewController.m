//
//  DemoZooZSDKViewController.m
//  DemoZooZSDK
//
//  Created by Ronen Morecki on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DemoZooZSDKViewController.h"

@implementation DemoZooZSDKViewController



-(IBAction)buyMore{
	paymentSuccessLabel.hidden = YES;
	
	ZooZ * zooz = [ZooZ sharedInstance];
    
    zooz.sandbox = YES;
    
    zooz.tintColor = [UIColor colorWithRed:1 green:0.8 blue:0 alpha:1];
    
    zooz.barButtonTintColor = [UIColor darkGrayColor];
    
    ZooZPaymentRequest * req = [zooz createPaymentRequestWithTotal:12.1 invoiceRefNumber:@"test invoice ref-1234" delegate:self];
    
    req.currencyCode = @"EUR";
    
    req.payerDetails.firstName = @"Some";
    
    req.payerDetails.email = @"test@zooz.com";
    
    req.payerDetails.address.zip=@"01234";
    
    req.requireAddress = NO;
    
    ZooZInvoiceItem * item = [ZooZInvoiceItem invoiceItem:12.1 quantity:1 name:@"T-Shirt"];
    
    item.itemId = @"refId-12345678"; // optional
    
    [req addItem:item];
    
    req.invoice.additionalDetails = @"Custom invoice description text";
        
    [zooz openPayment:req forAppKey:@"951bde04-5a26-4200-a94e-34d775a1e5f9"];
    
}
- (void)openPaymentRequestFailed:(ZooZPaymentRequest *)request withErrorCode:(int)errorCode andErrorMessage:(NSString *)errorMessage{
	NSLog(@"failed: %@", errorMessage);
    //this is a network / integration failure, not a payment processing failure.
	
}

//Called in the background thread - before user closes the payment dialog
//Do not refresh UI at this callback - see paymentSuccessDialogClosed
- (void)paymentSuccessWithResponse:(ZooZPaymentResponse *)response{
    
	NSLog(@"payment success with payment Id: %@, %@, %@, %f %@", response.transactionId, response.cardType, response.cardDisplayString, response.paidAmount, response.paymentToken);
}

//called after successful payment and after the user closed the payment dialog
-(void)paymentSuccessDialogClosed{
    NSLog(@"Payment dialog closed after success");
    //see paymentSuccessWithResponse: for the response transaction ID. 
   	paymentSuccessLabel.hidden = NO;
}

- (void)paymentCanceled{
	NSLog(@"payment cancelled");
    //dialog closed without payment completed
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}



- (void)dealloc {
	[paymentSuccessLabel release];
    [super dealloc];
}

@end
