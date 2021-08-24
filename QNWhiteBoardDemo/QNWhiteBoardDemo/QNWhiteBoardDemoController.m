//
//  QNWhiteBoardDemoController.m
//  QNWhiteBoardDemo
//
//  Created by 郭茜 on 2021/5/13.
//

#import "QNWhiteBoardDemoController.h"
#import <AVFoundation/AVFoundation.h>
#import <QNWhiteBoardSDK/QNWhiteBoardSDK.h>
#import "QNSelectResourceViewController.h"
#import "QNWhiteBoardPageControl.h"
#import "QNWhiteBoardPageListView.h"
#import "QNWhiteBoardFloatingMenu.h"
#import "QNWhiteBoardExpandableToolbar.h"

@interface QNWhiteBoardDemoController ()<QNWhiteboardDelegate,QNWhiteboardUIDelegate>
{
    UICollectionViewController * menuBar;
    QNWhiteBoardPageControl * pageControl;
    QNWhiteBoardFloatingMenu * floatingMenu;
    QNWhiteBoardPageListView * pageListView;
    QNWhiteBoardExpandableToolbar * toolbar;
}
@end

@implementation QNWhiteBoardDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle * bundle = [NSBundle mainBundle];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 64, 64)];
    [button setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateNormal];
    [button setTintColor:UIColor.blackColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(onBackPressed) forControlEvents:UIControlEventTouchDown];
    
    //添加工具栏
    toolbar = [[QNWhiteBoardExpandableToolbar alloc] init];
    [self.view addSubview:toolbar];
    [toolbar addConstraintToParent:self.view];
    toolbar.uiDelegate = self;
    
    //添加页导航
    pageControl = [[UINib nibWithNibName:@"QNWhiteBoardPageControl" bundle:bundle] instantiateWithOwner:nil options:nil].firstObject;
    
    pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:pageControl];
    [pageControl layoutMenu:self.view];
    
    pageControl.uiDelegate = self;
    
    //添加widget菜单
    floatingMenu = [[QNWhiteBoardFloatingMenu alloc] init];
    floatingMenu.delegate = self;
   
    [self.view addSubview:floatingMenu];
    [floatingMenu layoutMenu:self.view];
    
    [super initializeWhiteboard];
    
    [self joinRoom];
    
}

- (void)addView:(UIView *)view_ {
    [self.view addSubview:view_];
}

-(void)onBackPressed
{
    [[QNWhiteboardControl instance] cleanPage:[[QNWhiteboardControl instance] getCurrentPage].pageId];

}

-(void)joinRoom
{
    [[QNWhiteboardControl instance] addListener:self];
    QNWhiteboardJoinRoomConfig *config = [[QNWhiteboardJoinRoomConfig alloc]init];
    config.aspectRatio = 0.5;
    config.title = @"3bdhajfjsa";
    [[QNWhiteboardControl instance] joinRoom:self.roomToken config:config];
    
}

- (void)onJoinSuccess:(QNWhiteBoardRoom *)room who:(QNWhiteBoardRoomMember *)me {
    
    QNWhiteBoardInfo *info = [[QNWhiteboardControl instance] getViewPort];
    NSLog(@"-----------%@",info);
}

//文档被滚动到顶部或底部时触发
- (void)onWidgetScrolled:(QNWhiteBoardWidgetScrollInfo *)info {
    
}

//页面被清空时触发
- (void)onBoardCleaned:(NSString *)pageId_ {
    
    [self dismissViewControllerAnimated:YES completion:^{
        [[QNWhiteboardControl instance] leaveRoom];
        [super closeWhiteboard];
    }];
}
                     
@end
