//
//  QNStartViewController.m
//  QNWhiteBoardDemo
//
//  Created by 郭茜 on 2021/6/8.
//

#import "QNStartViewController.h"
#import "QNWhiteBoardDemoController.h"

@interface QNStartViewController ()

@end

@implementation QNStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];

    UIButton *startButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 50)];
    [startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [startButton setTitle:@"进入白板" forState:UIControlStateNormal];
    
    [startButton addTarget:self action:@selector(startButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
}

- (void)startButtonClick {
    
    QNWhiteBoardDemoController * demoEntry = [[QNWhiteBoardDemoController alloc]init];
    demoEntry.roomToken = @"QxZugR8TAhI38AiJ_cptTl3RbzLyca3t-AAiH-Hh:pM05ijM2sOGJKvkDxP1c1QXzOH0=:eyJhcHBJZCI6ImQ4ZHJlOHcxcCIsInJvb21OYW1lIjoiMTIzNDU0IiwidXNlcklkIjoiMTIzNDUiLCJleHBpcmVBdCI6MTYyNjUxODUyNzg3NDczMTQ5MCwicGVybWlzc2lvbiI6ImFkbWluIn0=";
    demoEntry.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:demoEntry animated:YES completion:^{}];
        
}

@end
