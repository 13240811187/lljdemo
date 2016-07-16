//
//  webServiceManager.h
//  faceRecognizeTest
//
//  Created by Crab on 15/12/24.
//  Copyright © 2015年 Crab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVKit/AVKit.h>

@interface webServiceManager :NSObject


/**
 认证登陆
 */
- (NSDictionary *)authFaceBaseaUserId:(NSString *)userId andImageBase64:(NSString *)img64 ;

/**
 生活照注册
 */
-(NSDictionary *)registerUserBaseUserId:(NSString *)userId andRealName:(NSString *)realName andCertNo:(NSString *)certNO andImageBase64:(NSString *)imgB64;

/**
 公安部底片注册
 */
- (NSDictionary *)createPoliceFaceUserWithUserId:(NSString *)userId andRealName:(NSString *)realName andCertNum:(NSString *)certNum;
/**
 OCR注册
 */
- (NSDictionary *)ocrRegisterWithIdentifyWithUserId:(NSString *)userId andRealName:(NSString *)realName andSex:(NSString *)sex andFolk:(NSString *)folk andBirthday:(NSString *)birthday andAddress:(NSString *)address andCertNum:(NSString *)certNum andIssue:(NSString *)issue andPeriod:(NSString *)period andImageB64:(NSString *)imgB64;
/**
 获取用户相片
 */
- (NSDictionary *)getUserPicturesBaseUserId:(NSString *)userId;
/**
 设置默认对比图片
 */
- (NSDictionary *)setComparePictureWithAppId:(NSString *)appId andFaceId:(NSString *)faceId andUserID:(NSString *)userId;
@end
