//
//  imagesModel.h
//  faceRecognizeTest
//
//  Created by Crab on 16/1/19.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface imagesModel : NSObject
/**
 照片数组
 */
@property (nonatomic,strong) NSArray *images;

@property (nonatomic,strong) NSString *faceId;
@property (nonatomic,strong) NSString *imgB64;
@property (nonatomic,strong) NSString *isDefault;
@property (nonatomic,strong) NSString *isPicFilm;

@end
