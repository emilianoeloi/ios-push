//
//  Utilities.m
//  pushzeroum
//
//  Created by emilianoeloi on 2/15/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+(NSString *)stringOfDeviceToken:(NSData *) deviceToken {
    NSString* newToken = [deviceToken description];
    newToken = [newToken stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    newToken = [newToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    return newToken;
    
}

@end
