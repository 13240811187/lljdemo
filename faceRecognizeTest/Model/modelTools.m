//
//  modelTools.m
//  faceRecognizeTest
//
//  Created by Crab on 16/1/13.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import "modelTools.h"
#import "imagesModel.h"

@implementation modelTools
- (NSString *)similarityPlist {
    if (!_similarityPlist) {
        _similarityPlist = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"similarityPlist.plist"];
        
    }
    return _similarityPlist;
}
+ (NSArray *)imagesByResponseDic:(NSDictionary *)dic {
    NSMutableArray *imageMutableArray = [NSMutableArray array];
    NSArray *imgGroup = [dic objectForKey:@"imgGroup"];
    for (NSDictionary *imageDic in imgGroup) {
        imagesModel *imgModel = [imagesModel new];
        [imgModel setValuesForKeysWithDictionary:imageDic];
        [imageMutableArray addObject:imgModel];
        
    }
    return [imageMutableArray copy];
}
+ (NSDictionary *)getDicFromResponseStr:(NSString *)str {
    NSData *responseData = [str dataUsingEncoding:kCFStringEncodingUTF8];
    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:nil];
    return responseDic;
}
+ (NSString *)dicTransformToJsonString:(NSDictionary *)dic {
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc]initWithData:jsonData encoding:4];
}
/**
 读取用户相似度配置文件
 */
+ (NSDictionary *)readDataFromPlist:(NSString *)plistPath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:plistPath]) {
     return  [NSDictionary dictionaryWithContentsOfFile:plistPath];
//        return [NSArray arrayWithContentsOfFile:plistPath ];
    } else {
        return nil;
    }
    
}
/**
 读取对应相似度，并转化为可传参数
 */
+ (NSString *)readSimilarityDataFromPlistPath:(NSString *)plistPath atIndexPaht:(NSString *)key {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:plistPath]) {
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        NSString *similarityStr = [dic objectForKey:key];
        
        return similarityStr;
    } else {
        return nil;
    }
}
/**
 返回响应体照片编码数组
 */
+ (NSArray *)resovelImagesFromResponseDic:(NSDictionary*)responseDic{
    
    NSArray *imgGroup = [responseDic objectForKey:@"imgGroup"];
    
    NSMutableArray *images = [NSMutableArray array];
    for (NSDictionary *dic in imgGroup) {
        NSString *imgB64Str = [dic objectForKey:@"imgB64"];
    NSData *decodeData = [[NSData alloc]initWithBase64EncodedString:imgB64Str options: NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image = [UIImage imageWithData:decodeData];
        [images addObject:image];
    }
    return [images copy];
   
}
+ (UIImage *)decodeImageFromB64Str:(NSString *)B64Str {
    NSData *decodeData = [[NSData alloc]initWithBase64EncodedString:B64Str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:decodeData];
    
    
    return image;   
}
+ (NSString *)encodeImageToB64Str:(UIImage *)image {
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    NSString *encodeB64Str = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodeB64Str;
}
/**
 身份证正则表达式
 */

+(BOOL)validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
@end
