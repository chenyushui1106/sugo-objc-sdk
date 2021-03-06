//
// Copyright (c) 2014 Sugo. All rights reserved.

#import <Foundation/Foundation.h>
#import "MPAbstractABTestDesignerMessage.h"

@interface MPABTestDesignerDeviceInfoResponseMessage : MPAbstractABTestDesignerMessage

+ (instancetype)message;

@property (nonatomic, copy) NSString *systemName;
@property (nonatomic, copy) NSString *systemVersion;
@property (nonatomic, copy) NSString *appVersion;
@property (nonatomic, copy) NSString *appRelease;
@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, copy) NSString *deviceModel;
@property (nonatomic, copy) NSString *libVersion;
@property (nonatomic, copy) NSArray *availableFontFamilies;
@property (nonatomic, copy) NSString *mainBundleIdentifier;
@property (nonatomic, copy) NSString *secretKey;
@property (nonatomic, copy) NSString *trackingVersion;

@end
