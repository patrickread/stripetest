//
//  BTViewController.h
//  stripetest
//
//  Created by Patrick Read on 10/29/14.
//  Copyright (c) 2014 Beam Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stripe.h"
#import "Stripe+ApplePay.h"

@interface BTViewController : UIViewController

- (void)createBackendChargeWithToken:(STPToken *)token completion:(void (^)(PKPaymentAuthorizationStatus))completion;

@end
