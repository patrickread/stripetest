//
//  ViewController.m
//  stripetest
//
//  Created by Patrick Read on 10/28/14.
//  Copyright (c) 2014 Beam Technologies. All rights reserved.
//

#import "ViewController.h"
#import "Stripe.h"
#import "Stripe+ApplePay.h"
#import <PassKit/PassKit.h>
#import "STPTestPaymentAuthorizationViewController.h"

#define kMerchantID @"merchant.com.beamtoothbrush.beamapp"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)generatePaymentRequest {
    PKPaymentRequest *request = [Stripe
                                 paymentRequestWithMerchantIdentifier:kMerchantID];
    PKPaymentSummaryItem *totalItem = [PKPaymentSummaryItem summaryItemWithLabel:@"Brush Head" amount:[NSDecimalNumber decimalNumberWithString:@"3.99"]];
    [request setPaymentSummaryItems:@[totalItem]];
    
    if ([Stripe canSubmitPaymentRequest:request]) {
        STPTestPaymentAuthorizationViewController *paymentController;
#if DEBUG
        paymentController = [[STPTestPaymentAuthorizationViewController alloc]
                             initWithPaymentRequest:request];
        paymentController.delegate = self;
#else
        paymentController = [[PKPaymentAuthorizationViewController alloc]
                             initWithPaymentRequest:paymentRequest];
        paymentController.delegate = self;
#endif
        [self presentViewController:paymentController animated:YES completion:nil];
    } else {
        // Show the user your own credit card form (see options 2 or 3)
    }
    
}

- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didAuthorizePayment:(PKPayment *)payment completion:(void (^)(PKPaymentAuthorizationStatus))completion {
    
}

- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller {
    
}

@end
