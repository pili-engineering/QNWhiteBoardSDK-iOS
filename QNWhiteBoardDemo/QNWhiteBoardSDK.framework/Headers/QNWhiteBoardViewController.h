//
//  QNWhiteBoardViewController.h
//  QNWhiteBoardSDK
//
//  Created by 郭茜 on 2021/5/20.
//

#import <GLKit/GLKit.h>
#import <UIKit/UIKit.h>
#import "QNWhiteboardControl.h"
#import "QNWhiteboardUIDelegate.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,QNViewHorizonAlign)
{
    //水平方向居中对齐
    QNViewHorizonAlignCenter,
    //水平方向左对齐
    QNViewHorizonAlignLeft,
    //水平方向右对齐
    QNViewHorizonAlignRight
};
typedef NS_ENUM(NSInteger,QNViewVerticalAlign)
{
    //垂直方向居中对齐
    QNViewVerticalAlignCenter,
    //垂直方向顶部对齐
    QNViewVerticalAlignTop,
    //垂直方向底部对齐
    QNViewVerticalAlignBottom
};

@interface QNWhiteBoardViewController : UIViewController<QNWhiteboardUIDelegate,QNWhiteboardDelegate>

/**
 lockRatio表示是否根据内容的比例来锁定屏幕，适配的规则由horAlign和verAlign来指定。默认需要适配。
 */
@property (nonatomic,assign) BOOL lockRatio;

/**
    view在autoScale为YES的情况下水平对齐设定，默认为居中
 */
@property (nonatomic,assign) QNViewHorizonAlign horAlign;

/**
    view在autoScale为YES的情况下垂直对齐设定，默认值为居中
 */
@property (nonatomic,assign) QNViewVerticalAlign verAlign;

-(bool)initRender:(CGSize)size;

-(void)setDirty;


-(void)presentViewController:(UIViewController *)controller_;



-(void)initializeWhiteboard;
-(void)closeWhiteboard;

@end

NS_ASSUME_NONNULL_END
