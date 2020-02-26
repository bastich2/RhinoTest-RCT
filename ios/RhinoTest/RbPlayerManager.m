//
//  RbPlayerManager.m
//  RhinoTest
//
//  Created by Bastian Suarez on 2/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RbPlayerManager.h"
#import <React/RCTLog.h>
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>
#import <RBSDKPlayer/RBSDKPlayer.h>
#import <React/RCTBridgeModule.h>

@interface RbPlayerManager () <RCTBridgeModule>
@property (strong, nonatomic) RBSDKPlayerViewController *playerController;
@property (strong, nonatomic) UIView *containerView;
@property (nonatomic, copy) RCTBubblingEventBlock onCredentialsSetted;
@end

@implementation RbPlayerManager

RCT_EXPORT_MODULE(RbPlayer);
RCT_EXPORT_VIEW_PROPERTY(onCredentialsSetted, RCTBubblingEventBlock);
RCT_CUSTOM_VIEW_PROPERTY(credentials, NSDictionary, UIView) {
  NSDictionary *credentials = json ? [RCTConvert NSDictionary:json] : nil;
  if (credentials) {
    NSString *clientId = credentials[@"clientId"];
    NSString *secretId = credentials[@"secretId"];
    NSString *accountId = credentials[@"accountId"];
    if (clientId && secretId && accountId) {
      [self setClientId:clientId secretId:secretId accountId:accountId];
      _onCredentialsSetted(@{
        @"hello": @"HOLI!"
      });
    }
  }}
//RCT_EXPORT_METHOD(setCredentials:(NSDictionary *)credentials) {
//  RCTLogInfo(@"Estas son mis credenciales %@", credentials);
//}

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
  //  RBSDKPlayerOption options = (RBSDKPlayerOptionAutoPlay);
  //  NSString *reelId = @"00000000-0000-0000-0000-000000010855";
  //  self.playerController = [[RBSDKRhinobirdPlayerViewController alloc] initWithReelId:reelId
  //                                                                             options:options
  //                                                                            delegate:self];
  //  return self.playerController.view;
  self.containerView = [UIView new];
  return self.containerView;
}

@end
