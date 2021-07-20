//
//  WhiteboardPageControl.m
//  whiteboard_sdk
//
//  Created by mac zhang on 2021/4/26.
//

#import "QNWhiteBoardPageControl.h"
#import <QNWhiteBoardSDK/QNWhiteBoardSDK.h>
#import "QNWhiteBoardPageListView.h"
#import "QNWhiteBoardDemoController.h"

@interface QNWhiteBoardPageControl()
{
    UIBarButtonItem * backButton;
    UIBarButtonItem * allPageBtn;
    UIBarButtonItem * prevPageBtn;
    UIBarButtonItem * nextPageBtn;
    UIBarButtonItem * currentPageInfo;
 
    NSInteger currentPageNumber;
    NSInteger maxPageNumber;
    BOOL isPageListShown;

}
@property (nonatomic,retain) QNWhiteBoardPageListView * pageListView;
@end
@implementation QNWhiteBoardPageControl

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)awakeFromNib
{
    [super awakeFromNib];
    isPageListShown = NO;
    [[QNWhiteboardControl instance] addListener:self];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
//        isPageListShown = NO;
//        [[WhiteboardControl instance] addListener:self];
    }
    return self;
}
-(void)layoutMenu:(UIView *)parent
{
    self.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *pageHeight = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:36];
    NSLayoutConstraint *pageWidth = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:220];
    
    NSLayoutConstraint *pageBottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];
    NSLayoutConstraint *pageLeft = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    [parent addConstraints:[NSArray arrayWithObjects:pageWidth,pageHeight,pageLeft,pageBottom,nil]];
    
}
- (IBAction)listAllPage:(id)sender {
    if(isPageListShown)
    {
        _pageListView = [[QNWhiteBoardPageListView alloc] initWithNibName:@"QNWhiteBoardPageListView" bundle:[NSBundle bundleForClass:[QNWhiteBoardPageListView class]]];
        if ([self.uiDelegate respondsToSelector:@selector(addView:)]) {
            [self.uiDelegate addView:self.pageListView.view];
        }
        [self.pageListView setContraint:[self superview] pageCtrlView:self];
        
//        [self.uiDelegate hidePageListView];
    }
    else
    {
        [self.pageListView.view removeFromSuperview];
    }
    
    isPageListShown = !isPageListShown;
}
- (IBAction)prevPage:(id)sender {
    if(currentPageNumber > 1)
    {
        [[QNWhiteboardControl instance] switchToPageNumber:currentPageNumber -1];
    }
}
- (IBAction)nextPage:(id)sender {
    [[QNWhiteboardControl instance] switchToPageNumber:currentPageNumber +1];
}

-(void)updatePageInfo:(NSInteger)currentPageNo_ max:(NSInteger)maxPageNo_
{
    currentPageNumber = currentPageNo_;
    maxPageNumber = maxPageNo_;
    NSString * title = [NSString stringWithFormat:@"%ld/%ld",(long)currentPageNo_,(long)maxPageNo_];
    if(currentPageNumber == maxPageNumber)
    {
        [_nextPageCtrl setImage:[UIImage imageNamed:@"newPage" inBundle:[NSBundle bundleForClass:[QNWhiteBoardPageControl class]] compatibleWithTraitCollection:nil]];
    }
    else
    {
        [_nextPageCtrl setImage:[UIImage imageNamed:@"nextPage" inBundle:[NSBundle bundleForClass:[QNWhiteBoardPageControl class]] compatibleWithTraitCollection:nil]];
    }
    [_pageInfoCtrl setTitle:title];
}

-(void)onCurrentBoardPageChanged:(QNWhiteBoardPageInfo *)page_
{
    [self updatePageInfo:page_.pageNumber max:[[QNWhiteboardControl instance] getMaxPageNumber]];
}
@end
