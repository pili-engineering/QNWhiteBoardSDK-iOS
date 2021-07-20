//
//  QNWhiteBoardDemoController.h
//  QNWhiteBoardDemo
//
//  Created by 郭茜 on 2021/5/13.
//

#import <UIKit/UIKit.h>

#import <QNWhiteBoardSDK/QNWhiteBoardViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface QNWhiteBoardDemoController : QNWhiteBoardViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, copy) NSString *roomToken;

@end

NS_ASSUME_NONNULL_END
