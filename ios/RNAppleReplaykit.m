
#import "RNAppleReplaykit.h"
#import <React/RCTConvert.h>
#import "RNAppleReplaykit-Swift.h"

@implementation RNAppleReplaykit

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startBroadcast: (RCTPromiseResolveBlock) resolve rejecter:(RCTPromiseRejectBlock) reject)
{
    [[ReplayKitManager sharedInstance] startBroadcast:^(BOOL isSuccess, id  _Nullable response, NSError * _Nullable error) {
        if (isSuccess) {
            resolve(@"Start Broadcast");
        } else {
            reject(@"Start Broadcast", @"Fail to start broadcast", error);
        }
    }];
}

RCT_EXPORT_METHOD(stopBroadcast:(RCTPromiseResolveBlock) resolve rejecter:(RCTPromiseRejectBlock) reject)
{
    [[ReplayKitManager sharedInstance] stopBroadcast:^(BOOL isSuccess, id  _Nullable response, NSError * _Nullable error) {
        if (isSuccess) {
            resolve(@"Stop Broadcast");
        } else {
            reject(@"Stop Broadcast", @"Fail to start broadcast", error);
        }
    }];
}

RCT_EXPORT_METHOD(initialize: (NSDictionary *)config)
{
    BOOL showOverlay = [RCTConvert BOOL: config[@"showOverlay"]];
    self.screenRecordCoordinator = [[ScreenRecordCoordinator alloc] initWithShowOverlay:showOverlay];
    [ReplayFileUtil createReplaysFolder];
}

RCT_EXPORT_METHOD(startRecording:(RCTResponseSenderBlock)callback)
{
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    NSNumber *timeStampObj = [NSNumber numberWithInteger: [[NSNumber numberWithDouble: timeStamp] integerValue] ];
    NSMutableString *fileName = [[NSMutableString alloc] initWithString:@"Recording-"];
    [fileName appendString: [timeStampObj stringValue]];
    
    [self.screenRecordCoordinator
     startRecordingWithFileName:fileName
     recordingHandler:^(NSError *error) {
         if(error)
         {
             callback(@[[NSNull null], error.localizedDescription]);
         }
     }
     onCompletion:^(NSError *error) {
         if(error)
         {
             callback(@[[NSNull null], error.localizedDescription]);
         } else {
             NSArray *recordings = [self.screenRecordCoordinator listAllReplays];
             callback(@[recordings, [NSNull null]]);
         }
     }];
}

RCT_EXPORT_METHOD(deleteRecording:(NSString *)path callback:(RCTResponseSenderBlock)callback)
{
    [self.screenRecordCoordinator removeRecordingWithFilePath:path];
    NSArray *recordings = [self.screenRecordCoordinator listAllReplays];
    callback(@[recordings, path]);
}

RCT_EXPORT_METHOD(copyRecording:(NSString *)path callback:(RCTResponseSenderBlock)callback)
{
    static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: 15];
    for (int i=0; i<15; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    NSString *newPath = [[NSString stringWithFormat:@"%@/%@",
                          [path stringByDeletingLastPathComponent], randomString]
                         stringByAppendingPathExtension:[path pathExtension]];
    
    [self.screenRecordCoordinator copyRecordingWithFilePath:path destFileURL:newPath];
    NSArray *recordings = [self.screenRecordCoordinator listAllReplays];
    
    callback(@[recordings, newPath]);
}

RCT_EXPORT_METHOD(getRecordings:(RCTResponseSenderBlock)callback)
{
    NSArray *recordings = [self.screenRecordCoordinator listAllReplays];
    callback(@[recordings]);
}

RCT_EXPORT_METHOD(stopRecording:(RCTResponseSenderBlock)callback)
{
    [self.screenRecordCoordinator stopRecording];
    NSArray *recordings = [self.screenRecordCoordinator listAllReplays];
    callback(@[recordings]);
    
}

RCT_EXPORT_METHOD(previewRecording:(NSString *)path)
{
    [self.screenRecordCoordinator previewRecordingWithFileName:path];
}

@end
  
