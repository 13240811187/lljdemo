//
//  modelTools.h
//  faceRecognizeTest
//
//  Created by Crab on 16/1/13.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface modelTools : NSObject
@property (nonatomic,strong) NSString *similarityPlist;
/**
 解析数据模型化
 */
+ (NSArray *)imagesByResponseDic:(NSDictionary *)dic;

/**
 将相片转为Base64编码并返回
 */
+ (NSString *)encodeImageToB64Str:(UIImage *)image;

/**
 将base64编码解析为图片
 */
+ (UIImage *)decodeImageFromB64Str:(NSString *)B64Str;

/**
 读取对应相似度，并转化为可传参数
 */
+ (NSString *)readSimilarityDataFromPlistPath:(NSString *)plistPath atIndexPaht:(NSString *)key;

/**
 将响应体返回的字符串转为字典类型
 */
+ (NSDictionary *)getDicFromResponseStr:(NSString *)str;

/**
身份证正则表达式
 */
+ (BOOL)validateIdentityCard: (NSString *)identityCard;
/**
 将请求的字典类型转为json字符串
 */
+ (NSString *)dicTransformToJsonString:(NSDictionary *)dic;
/**
 读取用户相似度配置
 */
+ (NSDictionary *)readDataFromPlist:(NSString *)plistPath;

/**
 返回响应体照片编码数组
 */
+(NSArray *)resovelImagesFromResponseDic:(NSDictionary*)responseDic;
@end
