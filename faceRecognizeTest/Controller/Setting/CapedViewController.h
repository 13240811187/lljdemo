//
//  CapedViewController.h
//  faceRecognizeTest
//
//  Created by Crab on 15/12/21.
//  Copyright © 2015年 Crab. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^returnBlock)(NSString *value);

@interface CapedViewController : UIViewController
/**
 人脸采集拍照参数
 */
@property (nonatomic,strong) NSString *xmlSTR;

@property (nonatomic,strong) NSString *userName;

@property (nonatomic,strong) NSString *registerUserId;
@property (nonatomic,strong) NSString *realName;
@property (nonatomic,strong) NSString *certNo;


@end
