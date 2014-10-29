//
//  PaymentViewController.h
//  stripetest
//
//  Created by Patrick Read on 10/29/14.
//  Copyright (c) 2014 Beam Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTKView.h"
#import "BTViewController.h"

@interface PaymentViewController : BTViewController <PTKViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property(weak, nonatomic) PTKView *paymentView;

@end
