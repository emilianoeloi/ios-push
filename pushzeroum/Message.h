//
//  Message.h
//  pushzeroum
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

#import "JSONModel.h"

@interface Message : JSONModel

@property (nonatomic, strong) Device *device;
@property (nonatomic, strong) NSString *alert;

@end
