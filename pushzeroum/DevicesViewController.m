//
//  DevicesViewController.m
//  pushzeroum
//
//  Created by emilianoeloi on 2/16/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

#import "DevicesViewController.h"
#import "MessageViewController.h"

@implementation DevicesViewController

-(void)setDeviceList:(NSArray *)deviceList{
    _deviceList = deviceList;
    [_devicesTable reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_deviceList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeviceCell_ID" forIndexPath:indexPath];
    Device *device = _deviceList[indexPath.row];
    cell.device = device;
    [cell.textLabel setText:device.token];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"openMessageViewController"]) {
        MessageViewController *destViewController = segue.destinationViewController;
        DeviceCell *cell = (DeviceCell *)sender;
        destViewController.device = cell.device;
    }
}

@end
