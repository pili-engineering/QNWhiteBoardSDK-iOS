//
//  WBPageListView.m
//  whiteboard_sdk
//
//  Created by mac on 2021/4/29.
//

#import "QNWhiteBoardPageListView.h"
#import "QNWhiteBoardPageInfoCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import <QNWhiteBoardSDK/QNWhiteBoardSDK.h>

@interface QNWhiteBoardPageListView ()

@end

@implementation QNWhiteBoardPageListView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerNib:[UINib nibWithNibName:@"QNWhiteBoardPageInfoCell" bundle:[NSBundle bundleForClass:[QNWhiteBoardPageListView class]]] forCellReuseIdentifier:@"page"];
    
    self.tableView.layer.cornerRadius = 5.0f;
    self.tableView.layer.masksToBounds = YES;
    
    [[QNWhiteboardControl instance] addListener:self];
    
    self.tableView.estimatedRowHeight = 160;
    
}

-(void)setContraint:(UIView *)parent_ pageCtrlView:(UIView *)bottom_
{
    self.view.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *pageHeight = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:parent_ attribute:NSLayoutAttributeHeight multiplier:0.8 constant:0];
    NSLayoutConstraint *pageWidth = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:220];
    
    NSLayoutConstraint *pageBottom = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:bottom_ attribute:NSLayoutAttributeTop multiplier:1.0 constant:-10];
    NSLayoutConstraint *pageLeft = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:parent_ attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    [parent_ addConstraints:[NSArray arrayWithObjects:pageWidth,pageHeight,pageLeft,pageBottom,nil]];
}

#pragma mark - Table view data source

-(BOOL)tableView:(UITableView *)tableView shouldBeginMultipleSelectionInteractionAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[QNWhiteboardControl instance] getMaxPageNumber];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QNWhiteBoardPageInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"page" forIndexPath:indexPath];
    
    // Configure the cell...
    QNWhiteBoardPageInfo * page = [[QNWhiteboardControl instance]  getPageByIndex:indexPath.row];
    if(page)
    {
        cell.pageInfo = page;
        cell.pageNumber.text = [NSString stringWithFormat:@"%ld",page.pageNumber];
        [cell.thumbnails sd_setImageWithURL:[NSURL URLWithString:[page getThumbnailUrl]]];
        if(cell.isSelected)
        {
            cell.contentView.backgroundColor = UIColor.lightGrayColor;
        }
        else
            cell.contentView.backgroundColor = UIColor.whiteColor;
       
    }
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * header = [[NSBundle bundleForClass:[QNWhiteBoardPageListView class]] loadNibNamed:@"QNWhiteBoardPageCellHeader" owner:nil options:nil].firstObject;
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    QNWhiteBoardPageInfoCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = UIColor.systemBlueColor;
    [[QNWhiteboardControl instance] jumpBoardPage:cell.pageInfo.pageId];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QNWhiteBoardPageInfoCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = UIColor.systemBackgroundColor;;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

-(void)onBoardPageList:(NSArray *)list
{
    [self.tableView reloadData];
}
-(void)onCurrentBoardPageChanged:(QNWhiteBoardPageInfo *)page_
{
    [self.tableView reloadData];
    NSInteger row = [[QNWhiteboardControl instance] getMaxPageNumber] - page_.pageNumber;
    NSIndexPath * path = [NSIndexPath indexPathForRow:row  inSection:0];
    [self.tableView selectRowAtIndexPath:path animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];
}
-(void)onBoardPageInfoChanged:(QNWhiteBoardPageInfo *)page_
{
    [self.tableView reloadData];
}
@end
