//
//  DevicesViewController.h
//  pushzeroum
//
//  Created by emilianoeloi on 2/16/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DevicesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *devicesTable;
@property (nonatomic, strong) NSArray *deviceList;

@end
