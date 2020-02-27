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
#import <RBSDKPlayer/RBSDKPlayer.h>
#import <React/RCTBridgeModule.h>
#import "RBEventEmitterManager.h"

@interface RBPlayerManager () <RCTBridgeModule, RBSDKPlayerViewControllerDelegate>

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

    [self attachPlayerController:self.playerController];
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

    [self attachPlayerController:self.playerController];
  }
}

- (void)attachPlayerController:(RBSDKRhinobirdPlayerViewController *)playerController {
  playerController.view.frame = self.containerView.bounds;
  [self.containerView addSubview:playerController.view];

  [[RBEventEmitterManager sharedInstance] addSupportedEventName:@"onLoadDidSucceed"];
}

# pragma mark - Needed UIView

- (UIView *)view {
  self.containerView = [UIView new];
  return self.containerView;
}

# pragma mark - RBSDKPlayerViewControllerDelegate

- (void)playerControllerLoadDidSucceed:(BOOL)succeed withError:(nullable NSError *)error {
  succeed ? [[RBEventEmitterManager sharedInstance] sendEventWithName:@"onLoadDidSucceed" body:@{}] : nil;
}

- (void)playerControllerIsReadyToPlay {

}

- (void)playerControllerDidSwitchDirection:(RBSDKPlayerContentDirection)contentDirection media:(RBSDKPlayerMediaInfo *)media {

}

- (void)playerControllerDidChangePlayingStatus:(BOOL)isPlaying {

}

- (void)playerControllerCurrentMedia:(RBSDKPlayerMediaInfo *)media watchedTime:(float)watchedTime {

}

- (void)playerControllerDidChangeFullscreenStatus {

}

- (void)playerControllerWillChangeFullscreenStatus {

}

- (void)playerControllerWillReachEnd:(RBSDKPlayerContentDirection)contentDirection completionHandler:(void(^)(void))completionHandler {

}

- (void)playerControllerShowingControls:(BOOL)showingControls {

}

@end
