//
//  MessageViewController.m
//  pushzeroum
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

#import "MessageViewController.h"

@implementation MessageViewController

- (IBAction)sendMessage:(id)sender {
    
    Message *message = [[Message alloc]init];
    message.device = _device;
    message.alert = _alert.text;
    
    [[Services sharedService]sendPush:message andCompletion:^(NSError *error) {
        NSLog(@"%@", error.description);
    }];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _deviceToken.text = _device.token;
}

@end
