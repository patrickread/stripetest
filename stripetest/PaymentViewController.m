//
//  PaymentViewController.m
//  stripetest
//
//  Created by Patrick Read on 10/29/14.
//  Copyright (c) 2014 Beam Technologies. All rights reserved.
//

#import "PaymentViewController.h"
#import "Stripe.h"
#import "STPCard.h"

@interface PaymentViewController ()

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PTKView *view = [[PTKView alloc] initWithFrame:CGRectMake(15,20,290,55)];
    self.paymentView = view;
    self.paymentView.delegate = self;
    [self.view addSubview:self.paymentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)paymentView:(PTKView *)view withCard:(PTKCard *)card isValid:(BOOL)valid
{
    // Toggle navigation, for example
    self.saveButton.enabled = valid;
}

- (IBAction)save:(id)sender {
    STPCard *card = [[STPCard alloc] init];
    card.number = self.paymentView.card.number;
    card.expMonth = self.paymentView.card.expMonth;
    card.expYear = self.paymentView.card.expYear;
    card.cvc = self.paymentView.card.cvc;
    [Stripe createTokenWithCard:card completion:^(STPToken *token, NSError *error) {
        if (error) {
            [self handleError:error];
        } else {
            [self createBackendChargeWithToken:token completion:nil];
        }
    }];
}

- (void)handleError:(NSError*)error {
    // TODO do stuff!
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
