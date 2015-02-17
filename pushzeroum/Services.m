//
//  Services.m
//  pushzeroum
//
//  Created by emilianoeloi on 2/16/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

#import "Services.h"

@implementation Services

+ (id)sharedService
{
    static dispatch_once_t onceToken;
    static Services *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        if (sharedInstance == nil){
            sharedInstance = [[Services alloc] init];
        }
    });
    return sharedInstance;
}

-(void)fetchDevices:(FetchDevicesBlock)completion{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kServiceDevices parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSError *error;
        NSMutableArray *devices = [[NSMutableArray alloc]init];
        for (id object in responseObject) {
            Device *device = [[Device alloc]initWithDictionary:object error:&error];
            [devices addObject:device];
        }
        completion(devices, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completion(nil, error);
    }];
}

-(void)saveDevice:(Device *)device andCompletion:(SaveDeviceBlock)completion{
    NSDictionary *parameters = @{@"token":device.token};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:kServiceDevices parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        completion(nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completion(error);
    }];
}

@end
