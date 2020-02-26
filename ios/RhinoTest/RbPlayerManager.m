//
//  RbPlayerManager.m
//  RhinoTest
//
//  Created by Bastian Suarez on 2/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RbPlayerManager.h"
#import <React/RCTLog.h>
#import <RBSDKPlayer/RBSDKPlayer.h>

@interface RbPlayerManager ()

@property (strong, nonatomic) RBSDKPlayerViewController *playerController;

@end

@implementation RbPlayerManager

RCT_EXPORT_MODULE(RbPlayer);

- (void)setClientId:(NSString *)clientId secretId:(NSString *)secretId accountId:(NSString *)accountId {
  [RBSDKV2 setKeysWithClientId:clientId
                  clientSecret:secretId
                     accountId:accountId];
}
- (void)loadAsynchronouslyWithCompletionHandler {
  [RBSDKV2 loadAsynchronouslyWithCompletionHandler:^(BOOL success, NSError * _Nullable error) {
    
  }];
}

- (UIView *)view {
  RBSDKPlayerOption options = (RBSDKPlayerOptionAutoPlay);
  NSString *reelId = @"00000000-0000-0000-0000-000000010855";
  self.playerController = [[RBSDKRhinobirdPlayerViewController alloc] initWithReelId:reelId
                                                                             options:options
                                                                            delegate:self];
  return self.playerController.view;
}

@end
