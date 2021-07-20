//
//  AppDelegate.m
//  QNWhiteBoardDemo
//
//  Created by 郭茜 on 2021/5/14.
//

#import "AppDelegate.h"
#import "QNStartViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
    QNStartViewController *vc = [[QNStartViewController alloc] init];
    self.window.rootViewController = vc;
    self.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
