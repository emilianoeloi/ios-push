//
//  Device.m
//  pushzeroum
//
//  Created by emilianoeloi on 2/16/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

#import "Device.h"

@implementation Device

+ (JSONKeyMapper *)keyMapper{
    NSDictionary *mapper = @{@"token":@"token"};
    return [[JSONKeyMapper alloc]initWithDictionary:mapper];
}

@end
