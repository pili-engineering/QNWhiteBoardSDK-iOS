//
//  WBPageInfoCell.m
//  whiteboard_sdk
//
//  Created by mac on 2021/4/29.
//

#import "QNWhiteBoardPageInfoCell.h"
#import <QNWhiteBoardSDK/QNWhiteBoardSDK.h>

@implementation QNWhiteBoardPageInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)newPageAction:(UIButton *)sender {
    [[QNWhiteboardControl instance] insertBoardPage:self.pageInfo.pageId];
}
- (IBAction)deletePageAction:(id)sender {
    [[QNWhiteboardControl instance] deleteBoardPage:self.pageInfo.pageId];
}
@end
