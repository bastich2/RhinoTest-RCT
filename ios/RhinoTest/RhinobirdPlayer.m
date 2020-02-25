//
//  RhinobirdPlayer.m
//  RhinoTest
//
//  Created by Bastian Suarez on 2/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RhinobirdPlayer.h"
#import <React/RCTLog.h>

@implementation RhinobirdPlayer

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(printMessage)
{
  // Here's our method's code
  RCTLogInfo(@"printMessage called!");
}

@end
