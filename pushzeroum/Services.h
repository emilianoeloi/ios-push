//
//  Services.h
//  pushzeroum
//
//  Created by emilianoeloi on 2/16/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@interface Services : NSObject

+ (id) sharedService;
- (void) fetchDevices:(FetchDevicesBlock)completion;
- (void) saveDevice:(Device *)device andCompletion:(SaveDeviceBlock)completion;


@end
