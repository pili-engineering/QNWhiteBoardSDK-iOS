//
//  WhiteboardNative.h
//  whiteboard_sdk
//
//  Created by mac on 2021/4/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "LATInputConfig.h"
#import "LATActiveWidgetInfo.h"
#include "LATRoom.h"
#include "LATRoomMember.h"
#include "LATFileInfo.h"
#include "LATWhiteboardConfig.h"

NS_ASSUME_NONNULL_BEGIN

@class LATWhiteboardControl;
@interface LATWhiteboardNativeControl : NSObject

typedef NS_ENUM(NSInteger,WBNativeEvent)
{
    WBNativeEventUnkown,
    WBNativeScreenDirty,
    WBNativeOnGetRoomInfoSuccess,
    WBNativeOnGetRoomInfoFailed,
    WBNativeLoginSuccess,
    WBNativeWebsocketAbort,
    WBNativeWebsocketConnected,
    WBNativeWebsocketReconnecting,
    WBNativeWebsocketMessage,
    WBNativeDocumentSize,
    WBNativeDocumentChange,
    WBNativeBackgroundChange,
    WBNativeWidgetActive,
    WBNativeBucketOffset,
    WBNativeFileFlip,
    WBNativeFileScroll,
    WBNativeRecoveryState,
    WBNativeWidgetAction,
    WBNativeFileNetwork,
    WBNativePageCleaned,
    
};


+(void)prepareRenderContext:(int)width_ withHeight:(int)height_  context:(EAGLContext *)context_;
+(void)destroyRenderContext;

typedef void(^nativeDataArrived)(WBNativeEvent, NSDictionary * _Nullable);
//event,error code ,error message
typedef void(^nativeDataFailed)(WBNativeEvent,int, NSString * _Nullable);

typedef LATWhiteboardConfig *(^WhiteboardGetConfig)();

+(void)setConfig:(WhiteboardGetConfig)config_;

+(bool)init:(nativeDataArrived)dataDelegate failed:(nativeDataFailed)failDelegate;

+(void)requestRoomInfo:(nonnull LATRoom *)room_ member:(nonnull LATRoomMember *)me_;

+(void)joinRoom;

+(void)leaveRoom;

+(void)updateScreenSize:(int)width withHeight:(int)height;

+(bool)updateScreen;

+(void)onPointerInput:(UITouchPhase)type at:(CGPoint)position force:(float)force withId:(int)index isPencil:(bool)isPencil timestamp:(unsigned long long)ts;

+(void)insertFile:(nonnull LATFileInfo *)file_;

+(void)updateInputMode:(LATInputConfig *)config_;


+(void)playback:(int)type;

+(void)skip:(int)time;

+(void)setRefreshValue:(BOOL)isRefresh;

+(void)changeWidgetPage:(NSString *)widgetId_ number:(int)pageNo_;

+(void)flipWidgetDown:(LATActiveWidgetInfo *)widget_;

+(void)extendBoard;

+(void)newPage;

+(void)deletePage:(NSString *)pageId_;

+(void)cleanPage:(NSString *)pageId;

+(void)insertPageAfter:(NSString *)pageId_;

+(void)switchPage:(NSString *)pageId_;

+(void)scrollTo:(float)offset_;

+(void)deleteWidget:(NSString *)widgetId_;

+(void)scaleWidget:(NSString * )widgetId_ scale:(float)scale_;


+(void)restore;

+(void)cleanRecovery;
+(void)test;


+(void)steadySelect;

+(void)releaseSelect;

+(void)setBackgroundColor:(NSString *)color_;

+(void)connectSdkServer:(NSString *)url_ joinString:(NSString * )joinInfo_;

+(void)updateOssConfig:(LATWhiteboardConfig *)config_;


#pragma mark utilities

+(id)jsonToObject:(NSString * _Nonnull )jsonString_;
@end

NS_ASSUME_NONNULL_END
