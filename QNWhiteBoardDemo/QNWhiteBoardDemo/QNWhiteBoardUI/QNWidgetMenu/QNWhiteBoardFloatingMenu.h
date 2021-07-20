//
//  WhiteboardFloatingMenu.h
//  whiteboard_sdk
//
//  Created by mac on 2021/4/27.
//

#import <UIKit/UIKit.h>
#import <QNWhiteBoardSDK/QNWhiteBoardSDK.h>


NS_ASSUME_NONNULL_BEGIN

@interface QNWhiteBoardFloatingMenu : UIStackView <QNWhiteboardDelegate>

@property (weak,nonatomic) id<QNWhiteboardUIDelegate> delegate;

-(void)onWidgetActive:(QNActiveWidgetInfo * _Nullable)widgetInfo_;
-(void)layoutMenu:(UIView *)parent;

@end

NS_ASSUME_NONNULL_END
