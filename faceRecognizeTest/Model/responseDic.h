//
//  responseDic.h
//  faceRecognizeTest
//
//  Created by Crab on 16/1/21.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "imgGroup.h"
@interface responseDic : NSObject

@property (nonatomic,strong) NSString *errorCode;
@property (nonatomic,strong) NSString *userId;
@property (nonatomic,strong) NSString *similarity;
@property (nonatomic,strong) imgGroup *imgGroup;

@end
