//
//  ResourceViewController.h
//  whiteboard_sdk
//
//  Created by mac on 2021/4/29.
//

#import <UIKit/UIKit.h>
#import <QNWhiteBoardSDK/QNWhiteBoardSDK.h>
NS_ASSUME_NONNULL_BEGIN

@interface QNSelectResourceViewController : UIViewController <UIImagePickerControllerDelegate,UIDocumentPickerDelegate,UINavigationControllerDelegate>

@property (weak,nonatomic) _Nullable id<QNWhiteboardUIDelegate> uiDelegate;


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info;
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
@end

NS_ASSUME_NONNULL_END
