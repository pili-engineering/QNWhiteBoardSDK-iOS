//
//  NSString+Base64.h
//  MeetingGroup
//
//  Created by 陈凯 on 2017/4/10.
//  Copyright © 2017年 陈凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Base64)

+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;
+ (NSString*)encodeBase64Data:(NSData *)data;
+ (NSString*)decodeBase64Data:(NSData *)data;
+ (NSString*)jsonStringWithJSONObject:(id)obj;
+ (NSString *)hexStringFromColor:(UIColor *)color;
+ (UIColor *) colorWithHexString:(NSString *)color;
- (BOOL)isTraimString;
- (NSString *)trimString;
- (NSString *)md5;
- (CGSize)getStringSizewithStringFont:(NSDictionary *)attirbutes withWidthOrHeight:(CGFloat)fixedSize isWidthFixed:(BOOL)isWidth;
- (UIImage *)imageFromAttributes:(NSDictionary *)attributes size:(CGSize)size andMD5:(NSString *)md5 andLineHeight:(float)height;
-(NSString*)getFileMD5WithPath:(NSString*)path;

@end
