//
//  WBPageCellHeader.m
//  whiteboard_sdk
//
//  Created by mac on 2021/4/29.
//

#import "QNWhiteBoardPageCellHeader.h"
#import <QNWhiteBoardSDK/QNWhiteBoardSDK.h>

@implementation QNWhiteBoardPageCellHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)newPageAction:(UIButton *)sender {
    [[QNWhiteboardControl instance] newBoardPage];
    
}

@end
