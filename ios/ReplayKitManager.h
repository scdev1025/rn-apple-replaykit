//
//  ReplayKitManager.h
//  RNAppleReplaykit
//
//  Created by Dev on 2019/7/8.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReplayKit/ReplayKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CallBackHandler)(BOOL isSuccess, id _Nullable response, NSError * _Nullable error);

@interface ReplayKitManager : NSObject<RPBroadcastActivityViewControllerDelegate>

+ (ReplayKitManager*) sharedInstance;
- (void) startBroadcast:(nullable CallBackHandler) handler;
- (void) stopBroadcast:(nullable CallBackHandler) handler;

@end

NS_ASSUME_NONNULL_END
