//
//  RBEventEmitterManager.h
//  RhinoTest
//
//  Created by Bastian Suarez on 2/27/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <React/RCTEventEmitter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBEventEmitterManager : RCTEventEmitter

# pragma mark - Properties


# pragma mark - Public methods

+ (instancetype)sharedInstance;
- (void)addSupportedEventName:(NSString *)eventName;

@end

NS_ASSUME_NONNULL_END
