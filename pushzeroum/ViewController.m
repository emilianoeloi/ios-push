//
//  ViewController.m
//  pushzeroum
//
//  Created by emilianoeloi on 2/6/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *deviceTokenText;
@property (weak, nonatomic) IBOutlet UITextField *amountPushs;
@property (weak, nonatomic) IBOutlet UITableView *pushTable;
@property (nonatomic, strong) NSMutableArray *receivedPushes;
@property (nonatomic) long amount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _receivedPushes = [[NSMutableArray alloc]init];
    [self loadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData) name:UPDATE_DEVICE_TOKEN object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processReceivedPush:) name:PROCESS_RECEIVED_PUSH object:nil];
}

-(void)processReceivedPush:(NSNotification *)notifiation{
    
    NSDictionary *userInfo = notifiation.userInfo;
    NSDictionary *aps = [userInfo objectForKey:@"aps"];
    NSString *alert = [aps objectForKey:@"alert"];
    [_receivedPushes addObject:alert];
    [_pushTable reloadData];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id total = [defaults objectForKey:PUSH_AMOUNT];
    if (total) {
        _amount = [total longLongValue];
    }else{
        _amount = 0;
    }
    _amount++;
    _amountPushs.text = [NSString stringWithFormat:@"%ld",(long)_amount];
    
    [defaults setObject:[NSNumber numberWithLongLong:_amount] forKey:PUSH_AMOUNT];
    [defaults synchronize];
    
    [self backgroundColorToRed];
    [self performSelector:@selector(backgroundColorToGreen) withObject:self afterDelay:1.0f];
}

-(void)showAlertWithMessage:(NSString *)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notificação"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
}

-(void)loadData{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _deviceTokenText.text = [defaults valueForKey:DEVICE_TOKEN];
    _amountPushs.text = [NSString stringWithFormat:@"%ld",[[defaults objectForKey:PUSH_AMOUNT] longValue]];
}

-(void)backgroundColorToRed{
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
}
-(void)backgroundColorToGreen{
    [self.navigationController.navigationBar setBarTintColor:[UIColor greenColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_receivedPushes count];
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PuchCell_ID"];
    cell.textLabel.text = _receivedPushes[indexPath.row];
    return cell;
}

@end
