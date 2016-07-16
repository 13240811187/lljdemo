//
//  webServiceManager.m
//  faceRecognizeTest
//
//  Created by Crab on 15/12/24.
//  Copyright © 2015年 Crab. All rights reserved.
//

#import "webServiceManager.h"
#import "FaceTokenDemoServiceSvc.h"
#import "modelTools.h"
#define  appID @"000000"
#define liveLive @"50.00"
#define liveId @"50.00"
#define liveOCR @"50.00"
#define IdOCR @"50.00"

@interface webServiceManager ()
@property (nonatomic,strong) modelTools *modelTool;
@property (nonatomic,strong) NSString *plistPath;
@end

@implementation webServiceManager
-(modelTools *)modelTool {
    if (!_modelTool) {
        _modelTool = [modelTools new];
    }
    return _modelTool;
}
- (NSString *)plistPath {
    if (!_plistPath) {
        _plistPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"similarityPlist.plist"];
    }
    return _plistPath;
}
#pragma 参数工具
/**
 设备id目前采用的方式是讲某随机数存储到keyChain中来实现。有三方库
 */
- (NSString *)getDeviceID {
    
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSLog(@"DeviceID:%@",identifierForVendor);
    return identifierForVendor;
}


- (NSDictionary *)registerUserBaseUserId:(NSString *)userId andRealName:(NSString *)realName andCertNo:(NSString *)certNO andImageBase64:(NSString *)imgB64 {
    
    FaceTokenDemoServiceSoapBinding *bingding = [FaceTokenDemoServiceSvc FaceTokenDemoServiceSoapBinding];
    FaceTokenDemoServiceSvc_registerUserBase *request = [[FaceTokenDemoServiceSvc_registerUserBase alloc]init];
    NSLog(@"");
    
    
    NSDictionary *dic = @{@"appId":appID,@"deviceId":[self getDeviceID],@"liveLive":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"liveLive"],@"liveIdentity":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"liveIdentity"],@"liveOcr":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"liveOCR"],@"ocrIdentity":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"identityOCR"],@"userId":userId,@"name":realName,@"identityNum":certNO,@"imgB64":imgB64,@"regType":@"2"};;
    
    
    request.arg0 = [modelTools dicTransformToJsonString:dic];
    
    NSLog(@"request:%@",request.arg0);
    
    FaceTokenDemoServiceSoapBindingResponse *response =  [bingding registerUserBaseUsingParameters:request];
    
    if (response != nil) {
        NSLog(@"返回值不为空");
        NSLog(@"%@,%@,%@",response.headers,response.bodyParts,response.error);
    }
 else {
        NSLog(@"返回值:%@",response.bodyParts);
    
    }
    
    NSDictionary *responseDic = nil;
    for (id bodyPart in response.bodyParts) {
        
        if ([bodyPart isKindOfClass:[FaceTokenDemoServiceSvc_registerUserBaseResponse class]]) {
            FaceTokenDemoServiceSvc_registerUserBaseResponse *body = (FaceTokenDemoServiceSvc_registerUserBaseResponse *)bodyPart;
            NSLog(@"bodypart of response:%@",body.return_);
          responseDic = [modelTools getDicFromResponseStr:body.return_];
            NSLog(@"response:%@",responseDic);
        
        }
    }
    return responseDic;
    
}
/**
 公安部底片注册
 */
- (NSDictionary *)createPoliceFaceUserWithUserId:(NSString *)userId andRealName:(NSString *)realName andCertNum:(NSString *)certNum {
    FaceTokenDemoServiceSoapBinding *bingding = [FaceTokenDemoServiceSvc FaceTokenDemoServiceSoapBinding];
    FaceTokenDemoServiceSvc_createPoliceFaceBase *request = [[FaceTokenDemoServiceSvc_createPoliceFaceBase alloc]init];
    NSDictionary *dic = @{@"appId":appID,@"deviceId":[self getDeviceID],@"liveLive":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"liveLive"],@"liveIdentity":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"liveIdentity"],@"liveOcr":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"liveOCR"],@"ocrIdentity":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"identityOCR"],@"userId":userId,@"name":realName,@"identityNum":certNum,@"regType":@"2"};
    
    request.arg0 = [modelTools dicTransformToJsonString:dic];
    
    FaceTokenDemoServiceSoapBindingResponse *response = [bingding createPoliceFaceBaseUsingParameters:request];
    
    if (response.bodyParts == nil) {
        NSLog(@"response bodyParty is null");
    } else {
        NSLog(@"返回值不为空:%@",response.bodyParts);
    }
    
    NSDictionary *responseDic = nil;
    for (id bodyPart in response.bodyParts) {
        
        if ([bodyPart isKindOfClass:[FaceTokenDemoServiceSvc_createPoliceFaceBaseResponse class]]) {
            FaceTokenDemoServiceSvc_createPoliceFaceBaseResponse *body = (FaceTokenDemoServiceSvc_createPoliceFaceBaseResponse *)bodyPart;
            NSLog(@"断点测试");
            NSLog(@"bodypart of response:%@",body.return_);
            
            responseDic = [modelTools getDicFromResponseStr:body.return_];
        }
    }
    return responseDic;
   
    
}
/**
 OCR注册
 */
- (NSDictionary *)ocrRegisterWithIdentifyWithUserId:(NSString *)userId andRealName:(NSString *)realName andSex:(NSString *)sex andFolk:(NSString *)folk andBirthday:(NSString *)birthday andAddress:(NSString *)address andCertNum:(NSString *)certNum andIssue:(NSString *)issue andPeriod:(NSString *)period andImageB64:(NSString *)imgB64 {
    FaceTokenDemoServiceSoapBinding *bingding = [FaceTokenDemoServiceSvc FaceTokenDemoServiceSoapBinding];
    
    FaceTokenDemoServiceSvc_ocrRegistWithIdentityBase *request = [[FaceTokenDemoServiceSvc_ocrRegistWithIdentityBase alloc]init];//
  
      NSDictionary *dic = @{@"appId":appID,@"deviceId":[self getDeviceID],@"liveLive":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"liveLive"],@"liveIdentity":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"liveIdentity"],@"liveOcr":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"liveOCR"],@"ocrIdentity":[modelTools readSimilarityDataFromPlistPath:self.modelTool.similarityPlist atIndexPaht:@"identityOCR"],@"userId":userId,@"name":realName,@"sex":sex,@"nation":folk,@"dateOfBirth":birthday,@"addr":address,@"identityNum":certNum,@"authority":issue,@"validDate":period,@"imgB64":imgB64};
    request.arg0 = [modelTools dicTransformToJsonString:dic];
    NSLog(@"request:%@",request.arg0);
    
    FaceTokenDemoServiceSoapBindingResponse *response =  [bingding ocrRegistWithIdentityBaseUsingParameters:request];
    
    if (response.bodyParts == nil) {
        NSLog(@"response bodyParty is null");
    } else {
        NSLog(@"返回值不为空:%@",response.bodyParts);
    }
    
    NSDictionary *responseDic = nil;
    for (id bodyPart in response.bodyParts) {
        
        if ([bodyPart isKindOfClass:[FaceTokenDemoServiceSvc_ocrRegistWithIdentityBaseResponse class]]) {
            FaceTokenDemoServiceSvc_ocrRegistWithIdentityBaseResponse *body = (FaceTokenDemoServiceSvc_ocrRegistWithIdentityBaseResponse *)bodyPart;
            
            NSLog(@"ErrorCodeOfBodyParty:%@",body.return_);
            responseDic = [modelTools getDicFromResponseStr:body.return_];
        }
        
    }
    return responseDic;
}

- (NSDictionary *)authFaceBaseaUserId:(NSString *)userId andImageBase64:(NSString *)imgB64 {
    
    FaceTokenDemoServiceSoapBinding *bingding = [FaceTokenDemoServiceSvc FaceTokenDemoServiceSoapBinding];
    
    FaceTokenDemoServiceSvc_authFaceBase *request = [[FaceTokenDemoServiceSvc_authFaceBase alloc]init];//
    NSDictionary *dic = @{};
    if ([[NSFileManager defaultManager]fileExistsAtPath:self.plistPath]) {
       dic = @{@"appId":appID,@"deviceId":[self getDeviceID],@"liveLive":liveLive,@"liveIdentity":liveId,@"liveOcr":liveOCR,@"ocrIdentity":liveOCR,@"userId":userId,@"imgB64":imgB64,@"regType":@"2"};
    }
    
    
    request.arg0 = [modelTools dicTransformToJsonString:dic];
    NSLog(@"request:%@",request.arg0);
    
    FaceTokenDemoServiceSoapBindingResponse *response =  [bingding authFaceBaseUsingParameters:request];
    if (response != nil) {
        NSLog(@"返回值不为空");
        NSLog(@"%@,%@,%@",response.headers,response.bodyParts,response.error);
    }
    if (response.bodyParts == nil) {
        NSLog(@"response bodyParty is null");
    } else {
        NSLog(@"返回值bodyParts不为空:%@",response.bodyParts);
        
    }
    
    NSDictionary *responseDic = nil;
    for (id bodyPart in response.bodyParts) {
        
        if ([bodyPart isKindOfClass:[FaceTokenDemoServiceSvc_authFaceBaseResponse class]]) {
            FaceTokenDemoServiceSvc_authFaceBaseResponse *body = (FaceTokenDemoServiceSvc_authFaceBaseResponse *)bodyPart;
            NSLog(@"断点测试");
            NSLog(@"bodypart of response:%@",body.return_);
          responseDic  = [modelTools getDicFromResponseStr:body.return_];
            NSLog(@"responseDic:%@",responseDic);
        }
    }
    return responseDic;
}

- (NSDictionary *)getUserPicturesBaseUserId:(NSString *)userId {

    FaceTokenDemoServiceSoapBinding *bingding = [FaceTokenDemoServiceSvc FaceTokenDemoServiceSoapBinding];

    FaceTokenDemoServiceSvc_getPicturesBase *request = [[FaceTokenDemoServiceSvc_getPicturesBase alloc]init];//
    NSDictionary *dic = @{@"appId":appID,@"userId":userId};
    request.arg0 = [modelTools dicTransformToJsonString:dic];
    NSLog(@"request:%@",request.arg0);
    
   FaceTokenDemoServiceSoapBindingResponse *response =  [bingding getPicturesBaseUsingParameters:request];
    
    if (response.bodyParts == nil) {
        NSLog(@"response bodyParty is null");
    } else {
        NSLog(@"返回值不为空:%@",response.bodyParts);
    }
    
    NSDictionary *responseDic = @{};
    for (id bodyPart in response.bodyParts) {
        
       if ([bodyPart isKindOfClass:[FaceTokenDemoServiceSvc_getPicturesBaseResponse class]]) {
            FaceTokenDemoServiceSvc_getPicturesBaseResponse *body = (FaceTokenDemoServiceSvc_getPicturesBaseResponse *)bodyPart;
         
            NSLog(@"ErrorCodeOfBodyParty:%@",body.return_);
           responseDic = [modelTools getDicFromResponseStr:body.return_];
        }
    }
    return responseDic;
    
}
- (NSDictionary *)setPicturesFilm {
    
    FaceTokenDemoServiceSoapBinding *bingding = [FaceTokenDemoServiceSvc FaceTokenDemoServiceSoapBinding];
    
    FaceTokenDemoServiceSvc_SetPictureFilmBase *request = [[FaceTokenDemoServiceSvc_SetPictureFilmBase alloc]init];//
    NSDictionary *dic = @{@"app_id":@"11111",@"imgB64":@"fafdfs1212",@"userId":@"person1",@"fileName":@"XXX.jpg",@"certNo":@"230925196203158654",@"realName":@"XXX"};
    request.arg0 = [modelTools dicTransformToJsonString:dic];
    
    NSLog(@"request:%@",request.arg0);
    
    FaceTokenDemoServiceSoapBindingResponse *response =  [bingding SetPictureFilmBaseUsingParameters:request];
    
    if (response.bodyParts == nil) {
        NSLog(@"response bodyParty is null");
    } else {
        NSLog(@"返回值不为空:%@",response.bodyParts);
    }
    
    NSDictionary *responseDic = @{};
    for (id bodyPart in response.bodyParts) {
        
        if ([bodyPart isKindOfClass:[FaceTokenDemoServiceSvc_SetPictureFilmBaseResponse class]]) {
            FaceTokenDemoServiceSvc_SetPictureFilmBaseResponse *body = (FaceTokenDemoServiceSvc_SetPictureFilmBaseResponse *)bodyPart;
            NSLog(@"bodypart of response:%@",body.return_);
            responseDic = [modelTools getDicFromResponseStr:body.return_];
            
        }
    }
    return responseDic;
    
}

- (NSDictionary *)setComparePictureWithAppId:(NSString *)appId andFaceId:(NSString *)faceId andUserID:(NSString *)userId  {
    
    FaceTokenDemoServiceSoapBinding *bingding = [FaceTokenDemoServiceSvc FaceTokenDemoServiceSoapBinding];
    
    FaceTokenDemoServiceSvc_setComparePictureBase *request = [[FaceTokenDemoServiceSvc_setComparePictureBase alloc]init];//
    NSDictionary *dic = @{@"appId":appID,@"faceId":faceId,@"userId":userId};
   
    request.arg0 = [modelTools dicTransformToJsonString:dic];
    
    NSLog(@"request:%@",request.arg0);
    
    FaceTokenDemoServiceSoapBindingResponse *response =  [bingding setComparePictureBaseUsingParameters:request];
    
    if (response.bodyParts == nil) {
        NSLog(@"response bodyParty is null");
    } else {
        NSLog(@"返回值不为空:%@",response.bodyParts);
        //        NSLog(@"%@",response.headers);
        //        NSLog(@"%@",response.error);
    }
    
    NSDictionary *responseDic = @{};
    for (id bodyPart in response.bodyParts) {
        
        if ([bodyPart isKindOfClass:[FaceTokenDemoServiceSvc_setComparePictureBaseResponse class]]) {
            FaceTokenDemoServiceSvc_setComparePictureBaseResponse *body = (FaceTokenDemoServiceSvc_setComparePictureBaseResponse *)bodyPart;
      
            NSLog(@"bodypart of response:%@",body.return_);
            responseDic = [modelTools getDicFromResponseStr:body.return_];
            
            
        }
    }
    return responseDic;
    
}
- (NSDictionary *)queryUserStateBaseUserId:(NSString *)userId {
    
    FaceTokenDemoServiceSoapBinding *bingding = [FaceTokenDemoServiceSvc FaceTokenDemoServiceSoapBinding];
    
    FaceTokenDemoServiceSvc_queryUserStateBase *request = [[FaceTokenDemoServiceSvc_queryUserStateBase alloc]init];//
    NSDictionary *dic = @{@"appId":appID,@"userId":userId};
    
    request.arg0 = [modelTools dicTransformToJsonString:dic];
    
    NSLog(@"request:%@",request.arg0);
    
    FaceTokenDemoServiceSoapBindingResponse *response =  [bingding queryUserStateBaseUsingParameters:request];
    
    if (response.bodyParts == nil) {
        NSLog(@"response bodyParty is null");
    } else {
        NSLog(@"返回值不为空:%@",response.bodyParts);
    }
    NSDictionary *responseDic = @{};
    for (id bodyPart in response.bodyParts) {
        
        if ([bodyPart isKindOfClass:[FaceTokenDemoServiceSvc_queryUserStateBase class]]) {
            FaceTokenDemoServiceSvc_queryUserStateBaseResponse *body = (FaceTokenDemoServiceSvc_queryUserStateBaseResponse *)bodyPart;
            NSLog(@"断点测试");
            NSLog(@"bodypart of response:%@",body.return_);
            responseDic = [modelTools getDicFromResponseStr:body.return_];
        }
    }
    return responseDic;
    
}




@end 
