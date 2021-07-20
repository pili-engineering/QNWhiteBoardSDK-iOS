//
//  WBPageListView.h
//  whiteboard_sdk
//
//  Created by mac on 2021/4/29.
//

#import <UIKit/UIKit.h>
#import <QNWhiteBoardSDK/QNWhiteBoardSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface QNWhiteBoardPageListView : UITableViewController <UITableViewDelegate,UITableViewDataSource,QNWhiteboardDelegate>

-(void)setContraint:(UIView *)parent_ pageCtrlView:(UIView *)bottom_;
@end

NS_ASSUME_NONNULL_END
