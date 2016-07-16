//
//  CapedViewController.m
//  faceRecognizeTest
//
//  Created by Crab on 15/12/21.
//  Copyright © 2015年 Crab. All rights reserved.
//

#import "CapedViewController.h"
#import "YYBase64.h"
#import "YYFaceView.h"
#import "SInfo.h"
#import "GResult.h"
#import "MInfo.h"
#import "webServiceManager.h"
#import "FaceTokenDemoServiceSvc.h"
#import "ViewController.h"
#import "imagesModel.h"



@interface CapedViewController ()<UIAlertViewDelegate>
{
    YYFaceView *faceView;
    SInfo *theSinfo;
}
@property (nonatomic,strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic,strong) NSString *plistPath;
@end

@implementation CapedViewController
-(NSString *)plistPath {
    if (!_plistPath) {
        _plistPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"userID.plist"];
    }
    return _plistPath;
}
- (UIActivityIndicatorView *)activityIndicatorView {
    if (!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 60,60)];
        _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
        _activityIndicatorView.backgroundColor = [UIColor clearColor];
        _activityIndicatorView.center = self.view.center;
    }
    return _activityIndicatorView;

}
- (void)viewWillDisappear:(BOOL)animated
{
    [faceView closeDevice];
    [faceView removeFromSuperview];
    faceView = nil;
    theSinfo = nil;
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.alpha = 0.6;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"人脸检测";
    [self setFaceViewRelatedValues];
    
    NSLog(@"regiseter:%@,realName:%@,certNo:%@",self.registerUserId,self.realName,self.certNo);
   
    
}
/**
 设置人脸采集视图的相关参数
 */
- (void)setFaceViewRelatedValues {
    faceView = [[YYFaceView alloc]initWithFrame:self.view.bounds];
    faceView.microModel = NO;
    [faceView setXMLConfig:self.xmlSTR];
    [self.view addSubview:faceView];
    
    theSinfo = [[SInfo alloc]init];
    theSinfo.InitXMLStr = self.xmlSTR;
   
    theSinfo.CustomInfo=@"370105198209021678";
    theSinfo.Serialno=@"12345678901234567890123456789011";
    [self.view addSubview:self.activityIndicatorView];
    
    
    [faceView showView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self capedImageActions];
    });

}
/**
 人脸采集逻辑
 */
- (void)capedImageActions
{
    [faceView startCaptureWithParam:theSinfo andResultB:^(GResult *result){
        NSString *title = nil;
        NSString *msg   = nil;
        //采集成功 调用登陆/注册方法
        if ([result.returnCode intValue] == 0) {
            title = @"采集成功，正在登陆...";
            //NSLog(@"imageBase64%@",result.imgBase64);
            [faceView showImgA];
            [self.activityIndicatorView startAnimating];
            
            
            [self doAuthFaceActionOrRegisterIdPhotoUserWithImageB64Str:result.imgBase64];
            
            NSLog(@"用户名：%@",self.userName);
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:okAction];
        
        }
        //采集失败则弹出提示框，并提示用户重新采集
        else
        {
            title = @"采集失败";
            msg = @"";
            if ([result.returnCode intValue] == -2) {
               // msg = @"检测为失败！";
                msg = @"是否重新采集";
            }else if([result.returnCode intValue] == -1){
                msg = @"抓取人脸超时";
            }

    UIAlertView *av = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"是" otherButtonTitles: @"否", nil];
            [av show];
            result.returnCode = nil;
        }
    } ];
}
- (void)doAuthFaceActionOrRegisterIdPhotoUserWithImageB64Str:(NSString *)imgB64Str {

    webServiceManager *manager = [webServiceManager new];
        NSString *title = @"";
        NSString *message = @"";
        if (self.userName.length == 0 ) { 
                 NSDictionary *dic = [manager registerUserBaseUserId:self.registerUserId andRealName:self.realName andCertNo:self.certNo andImageBase64:imgB64Str];
                NSString *errorCode = [dic objectForKey:@"errorCode"];
            if ([errorCode isEqualToString:@"000000"]) {
                title = @"注册成功";
                message = [NSString stringWithFormat:@"用户名:%@",[dic objectForKey:@"userId"]];
                
              
                
            } else {
                title = @"注册失败";
                message = [NSString stringWithFormat:@"错误码:%@",errorCode];
            }
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:okAction];
            
            [self.activityIndicatorView stopAnimating];
            [self presentViewController:alertController animated:NO completion:nil];
            
            
        } else if (self.realName.length==0 && self.certNo.length ==0){
            NSDictionary *dic = [manager authFaceBaseaUserId:self.userName andImageBase64:imgB64Str];
            NSString *errorCode = [dic objectForKey:@"errorCode"];
            if ([errorCode isEqualToString:@"000000"]) {
                title = @"登陆成功";
                message = [NSString stringWithFormat:@"相似度:%.0f",[[dic objectForKey:@"similarity"]floatValue]];
                
//              
//                NSNotification *notification = [[NSNotification alloc]initWithName:@"changeUserIdNotification" object:self userInfo:@{@"userID":self.userName}];
//                [[NSNotificationCenter defaultCenter]postNotification:notification];
                
    // 登陆成功后将用户名持久化
    NSDictionary *userID = @{@"userID":self.userName};
    [userID writeToFile:self.plistPath atomically:YES];
                
            } else {
                title = @"登陆失败";
                message = [NSString stringWithFormat:@"错误码:%@",errorCode];
            }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:okAction];
            
            [self.activityIndicatorView stopAnimating];
            [self presentViewController:alertController animated:NO completion:nil];
            
        }
        
    
        
        
    
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"是被点击");
        //[self presentViewController:self animated:NO completion:nil];
        [faceView showView];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self capedImageActions];
        });
    } else {
        NSLog(@"cancle 被点击");
        [self.navigationController popViewControllerAnimated:YES];
    
    }
    
}

@end
