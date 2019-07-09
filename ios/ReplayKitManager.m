//
//  ReplayKitManager.m
//  RNAppleReplaykit
//
//  Created by Dev on 2019/7/8.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "ReplayKitManager.h"

#import "RNAppleReplaykit-Swift.h"

@interface ReplayKitManager()
{
    CallBackHandler callbackHandler;
}

@property(strong, nonatomic) RPBroadcastController *broadcastController;
@property(strong, nonatomic) RPScreenRecorder *recorder;

@end

@implementation ReplayKitManager

+ (ReplayKitManager *)sharedInstance {
    static ReplayKitManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ReplayKitManager alloc] init];
    });
    return _sharedInstance;
}

- (void)startBroadcast:(CallBackHandler)handler {
    callbackHandler = handler;
    [RPBroadcastActivityViewController loadBroadcastActivityViewControllerWithHandler:^(RPBroadcastActivityViewController * _Nullable broadcastActivityViewController, NSError * _Nullable error) {
        if (error != nil) {
            callbackHandler(false, nil, error);
        } else {
            broadcastActivityViewController.delegate = self;
            UIViewController *rootVC = [[[UIApplication sharedApplication] delegate].window rootViewController];
            if (rootVC) {
                [rootVC presentViewController:broadcastActivityViewController animated:true completion:nil];
            }
        }
    }];
}

- (void)stopBroadcast:(CallBackHandler)handler {
    if (self.broadcastController) {
        [self.broadcastController finishBroadcastWithHandler:^(NSError * _Nullable error) {
            if (error) {
                handler(false, nil, error);
            } else {
                handler(true, nil, nil);
            }
        }];
    } else {
        handler(false, nil, nil);
    }
}

#pragma mark - broadcastActivityViewControllerDelegate

- (void)broadcastActivityViewController:(RPBroadcastActivityViewController *)broadcastActivityViewController didFinishWithBroadcastController:(RPBroadcastController *)broadcastController error:(NSError *)error {
    if (error) {
        [broadcastActivityViewController dismissViewControllerAnimated:true completion:^{
            callbackHandler(false, nil, error);
        }];
    } else {
        [broadcastActivityViewController dismissViewControllerAnimated:true completion:^{
            [broadcastController startBroadcastWithHandler:^(NSError * _Nullable error) {
                if (error) {
                    callbackHandler(false, nil, error);
                } else {
                    self.broadcastController = broadcastController;
                    callbackHandler(true, nil, nil);
                }
            }];
        }];
    }
}

@end
