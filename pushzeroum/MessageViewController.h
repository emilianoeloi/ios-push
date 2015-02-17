//
//  MessageViewController.h
//  pushzeroum
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *deviceToken;
@property (weak, nonatomic) IBOutlet UITextView *alert;
@property (nonatomic, strong) Device *device;
@end
