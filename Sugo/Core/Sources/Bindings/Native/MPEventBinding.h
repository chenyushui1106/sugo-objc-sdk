//
//  MPEventBinding.h
//  HelloSugo
//
//  Created by Amanda Canyon on 7/22/14.
//  Copyright (c) 2014 Sugo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPObjectSelector.h"
#import "Attributes.h"

@interface MPEventBinding : NSObject <NSCoding>

@property (nonatomic) NSUInteger ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) MPObjectSelector *path;
@property (nonatomic, copy) NSString *eventID;
@property (nonatomic, copy) NSString *eventName;
@property (nonatomic, strong) Attributes *attributes;

@property (nonatomic, assign) Class swizzleClass;

/*!
 @property

 @abstract
 Whether this specific binding is currently running on the device.

 @discussion
 This property will not be restored on unarchive, as the binding will need
 to be run again once the app is restarted.
 */
@property (nonatomic) BOOL running;

+ (id)bindingWithJSONObject:(id)object;

- (instancetype)init __unavailable;
- (instancetype)initWithEventID:(NSString *)eventID eventName:(NSString *)eventName onPath:(NSString *)path withAttributes:(Attributes *)attributes;

/*!
 Intercepts track calls and adds a property indicating the track event
 was from a binding
 */
+ (void)track:(NSString *)eventID eventName:(NSString *)eventName properties:(NSDictionary *)properties;
/*!
 Method stubs. Implement them in subclasses
 */
+ (NSString *)typeName;
- (void)execute;
- (void)stop;

@end
