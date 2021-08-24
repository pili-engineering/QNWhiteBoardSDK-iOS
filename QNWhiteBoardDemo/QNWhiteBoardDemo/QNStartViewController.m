//
//  QNStartViewController.m
//  QNWhiteBoardDemo
//
//  Created by 郭茜 on 2021/6/8.
//

#import "QNStartViewController.h"
#import "QNWhiteBoardDemoController.h"

@interface QNStartViewController ()

@property (nonatomic,strong) UITextField *textfiled;
@end

@implementation QNStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.textfiled = [[UITextField alloc]initWithFrame:CGRectMake(30, 270, self.view.frame.size.width - 60, 25)];
    self.textfiled.placeholder = @"请输入roomToken";
    self.textfiled.layer.borderWidth = 1;
    [self.view addSubview:self.textfiled];

    UIButton *startButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 50)];
    [startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [startButton setTitle:@"进入白板" forState:UIControlStateNormal];
    
    [startButton addTarget:self action:@selector(startButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
}

- (void)startButtonClick {
    
    QNWhiteBoardDemoController * demoEntry = [[QNWhiteBoardDemoController alloc]init];
    NSString *token = self.textfiled.text.length > 0
    ? self.textfiled.text
    : @"QxZugR8TAhI38AiJ_cptTl3RbzLyca3t-AAiH-Hh:srRQTXJzBogXrXVMq-FUSOdER3c=:eyJhcHBJZCI6ImQ4ZHJlOHcxcCIsImV4cGlyZUF0IjoxNjYxNTcxNzAzLCJwZXJtaXNzaW9uIjoidXNlciIsInJvb21OYW1lIjoiMTIzIiwidXNlcklkIjoiMTIzMzMifQ==";
    demoEntry.roomToken = token;
    demoEntry.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:demoEntry animated:YES completion:^{}];
        
}

@end
