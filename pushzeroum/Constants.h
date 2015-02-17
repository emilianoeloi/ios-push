//
//  Constants.h
//  pushzeroum
//
//  Created by emilianoeloi on 2/15/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

/// Domain
#import "Device.h"
#import "Message.h"

#define __(str) NSLocalizedString(str, nil)

#ifndef pushzeroum_Constants_h
#define pushzeroum_Constants_h

#define DEVICE_TOKEN @"DEVICE_TOKEN"
#define UPDATE_DEVICE_TOKEN @"UPDATE_DEVICE_TOKEN"
#define PROCESS_RECEIVED_PUSH @"PROCESS_RECEIVED_PUSH"
#define PUSH_AMOUNT @"PUSH_AMOUNT"

/// Callback Blocks
typedef void (^FetchDevicesBlock)(NSArray *devices, NSError *error);
typedef void (^SaveDeviceBlock)(NSError *error);
typedef void (^SendPushBlock)(NSError *error);

/// Url Constants
static NSString* const kServiceDevices = @"http://192.168.42.159:5000/api/1.0/devices";
static NSString* const kServiceSendPush = @"http://192.168.42.159:5000/api/1.0/push/send/%@";

#endif
