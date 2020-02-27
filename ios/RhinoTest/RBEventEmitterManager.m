//
//  RBEventEmitterManager.m
//  RhinoTest
//
//  Created by Bastian Suarez on 2/27/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBEventEmitterManager.h"

@interface RBEventEmitterManager ()

@property (strong, nonatomic) NSMutableArray<NSString *> *events;

@end

@implementation RBEventEmitterManager

RCT_EXPORT_MODULE(RBEventEmitter);

// Will be called when this module's first listener is added.
-(void)startObserving {
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(emitEvent:)
                                               name:@"emitEvent"
                                             object:nil];
}

// Will be called when this module's last listener is removed, or on dealloc.
-(void)stopObserving {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

# pragma mark - Public

- (void)emitEvent:(NSNotification *)notification {
  if (notification.userInfo[@"eventName"]) {
    NSString *eventName = notification.userInfo[@"eventName"];
    NSDictionary *info = @{};

    if (notification.userInfo[@"info"]) {
      info = notification.userInfo[@"info"];
    }

    [self sendEventWithName:eventName body:info];
  }
}

# pragma mark - Private

- (NSArray<NSString *> *)supportedEvents {
  return @[@"onLoadDidSucceed", @"onDidSwitchDirection"];
}

@end
