//
//  OSSFileManager.h
//  ChatboardCore
//
//  Created by 陈凯 on 2019/4/22.
//  Copyright © 2019 陈凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <string>
#include <functional>

NS_ASSUME_NONNULL_BEGIN

typedef std::function<void(const std::string& result)> fileCallBack;

/**
 当前正在执行中的任务，进度回调
 
 @param _currentProgress 当前进度
 @param _totalProgress 总进度
 */
typedef std::function<void(long long _currentProgress,long long _totalProgress)> taskProgress;

/**
 上传/下载结果回调
 
 @param _result bool value true/false
 */
typedef std::function<void(bool _result,std::string _data)> taskFinished;

@interface OSSFileManager : NSObject

+(void)downloadFileWithBucketName:(NSString *)bucketName EndPoint:(NSString *)endPoint RequestUrl:(NSString *)requestUrl FileParams:(NSString *)params Progress:(taskProgress)progress Finished:(taskFinished)finish;

+(void)uploadFileWithBucketName:(NSString *)bucketName EndPoint:(NSString *)endPoint RequestUrl:(NSString *)requestUrl FileParams:(NSString *)params Progress:(taskProgress)progress Finished:(taskFinished)finish;

+(unsigned long)getPdfPageCount:(NSString *)path;

+ (NSString *)URLEncodedString:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
