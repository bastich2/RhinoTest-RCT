//
//  RBCredentialsManager.m
//  RhinoTest
//
//  Created by Bastian Suarez on 2/26/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RBCredentialsManager.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTBridge.h>
#import <RBSDKPlayer/RBSDKPlayer.h>
#import <React/RCTEventDispatcher.h>

@interface RBCredentialsManager () <RCTBridgeModule>

@end
@implementation RBCredentialsManager

RCT_EXPORT_MODULE(RBCredentials);

RCT_EXPORT_METHOD(setCredentials:(NSDictionary *)credentials) {
  if (credentials) {
    NSString *clientId = credentials[@"clientId"];
    NSString *secretId = credentials[@"clientSecret"];
    NSString *accountId = credentials[@"accountId"];

    if (clientId && secretId && accountId) {
      [self setClientId:clientId secretId:secretId accountId:accountId];
    }
  }
}

RCT_REMAP_METHOD(loadCredentials,
                 credentialsWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  [self loadAsynchronouslyWithCompletionHandler:^(BOOL success, NSError *error) {
    if (success) {
      resolve(@"Done");
    } else {
      reject(@"Failed", @"Some error", error);
    }
  }];
}

- (void)setClientId:(NSString *)clientId secretId:(NSString *)secretId accountId:(NSString *)accountId {
  [RBSDKV2 setKeysWithClientId:clientId
                  clientSecret:secretId
                     accountId:accountId];
}

- (void)loadAsynchronouslyWithCompletionHandler:(void(^)(BOOL success, NSError *error))completion {
  [RBSDKV2 loadAsynchronouslyWithCompletionHandler:^(BOOL success, NSError * _Nullable error) {
    completion(success, error);
  }];
}


@end
