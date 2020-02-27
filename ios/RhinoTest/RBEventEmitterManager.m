//
//  RBEventEmitterManager.m
//  RhinoTest
//
//  Created by Bastian Suarez on 2/27/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBEventEmitterManager.h"
#import <React/RCTBridgeModule.h>

@interface RBEventEmitterManager () <RCTBridgeModule>

@property (strong, nonatomic) NSMutableArray<NSString *> *events;

@end

@implementation RBEventEmitterManager

RCT_EXPORT_MODULE(RBEventEmitter);

# pragma mark - Shared Instance

+ (instancetype)sharedInstance {
  static dispatch_once_t once;
  static id sharedInstance;
  dispatch_once(&once, ^{
    sharedInstance = [[self alloc] init];
    
  });
  return sharedInstance;
}

- (instancetype)init {
  if (self = [super init]) {
    self.events = [NSMutableArray new];
  }
  return self;
}

# pragma mark - Public

- (void)addSupportedEventName:(NSString *)eventName {
  if (![self.events containsObject:eventName]) {
    [self.events addObject:eventName];
  }
}

# pragma mark - Private

- (NSArray<NSString *> *)supportedEvents {
  return self.events ?: @[];
}

@end
