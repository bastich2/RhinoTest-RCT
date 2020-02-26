//
//  RBPlayerManager.m
//  RhinoTest
//
//  Created by Bastian Suarez on 2/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RBPlayerManager.h"
//#import <React/RCTLog.h>
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>
#import <RBSDKPlayer/RBSDKPlayer.h>
#import <React/RCTBridgeModule.h>

@interface RBPlayerManager () <RCTBridgeModule>

//@property (strong, nonatomic) RBSDKPlayerViewController *playerController;
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) RBSDKRhinobirdPlayerViewController *playerController;

@end

@implementation RBPlayerManager

RCT_EXPORT_MODULE(RBPlayer);

RCT_CUSTOM_VIEW_PROPERTY(setReel, NSString, UIView) {
  NSString *reelId = json ? [RCTConvert NSString:json] : nil;

  if (reelId && ![reelId isEqualToString:@""]) {
    RBSDKPlayerOption options = (RBSDKPlayerOptionAutoPlay |
                                 RBSDKPlayerOptionHideVisualIndex |
                                 RBSDKPlayerOptionHideCaption);
    self.playerController = [[RBSDKRhinobirdPlayerViewController alloc] initWithReelId:reelId
                                                                               options:options
                                                                              delegate:self];

    self.playerController.view.frame = self.containerView.bounds;
    [self.containerView addSubview:self.playerController.view];
  }
}

RCT_EXPORT_METHOD(addReel:(NSString *)reelId) {
  if (self.playerController && reelId && ![reelId isEqualToString:@""]) {
    [self.playerController addReelId:reelId];
  }
}

RCT_CUSTOM_VIEW_PROPERTY(setCollection, NSString, UIView) {
  NSString *collectionId = json ? [RCTConvert NSString:json] : nil;

  if (collectionId && ![collectionId isEqualToString:@""]) {
    RBSDKPlayerOption options = (RBSDKPlayerOptionAutoPlay |
                                 RBSDKPlayerOptionHideVisualIndex |
                                 RBSDKPlayerOptionHideCaption);
    self.playerController = [[RBSDKRhinobirdPlayerViewController alloc] initWithCollectionId:collectionId
                                                                                     options:options
                                                                                    delegate:self];

    self.playerController.view.frame = self.containerView.bounds;
    [self.containerView addSubview:self.playerController.view];
  }
}

- (UIView *)view {
  self.containerView = [UIView new];
  return self.containerView;
}

@end
