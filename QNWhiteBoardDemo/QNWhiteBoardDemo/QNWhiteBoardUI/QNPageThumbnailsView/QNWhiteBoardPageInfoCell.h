//
//  WBPageInfoCell.h
//  whiteboard_sdk
//
//  Created by mac on 2021/4/29.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImage.h>
#import <QNWhiteBoardSDK/QNWhiteBoardSDK.h>


NS_ASSUME_NONNULL_BEGIN

@interface QNWhiteBoardPageInfoCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *thumbnails;
@property (weak, nonatomic) IBOutlet UILabel *pageNumber;

@property (nonatomic,retain) QNWhiteBoardPageInfo * pageInfo;
@end

NS_ASSUME_NONNULL_END
