
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <ReplayKit/ReplayKit.h>

#import "ReplayKitManager.h"
#import "RNAppleReplaykit-Swift.h"

@interface RNAppleReplaykit : NSObject <RCTBridgeModule>

@property (strong, nonatomic) ReplayKitManager *replayKitManager;
@property (strong, nonatomic) ScreenRecordCoordinator *screenRecordCoordinator;

@end
