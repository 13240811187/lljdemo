//
//  imgGroup.h
//  faceRecognizeTest
//
//  Created by Crab on 16/1/21.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface imgGroup : NSObject

@property (nonatomic,strong) NSString *faceId;
@property (nonatomic,strong) NSString *imgB64;
@property (nonatomic,strong) NSNumber *isDefault;
@property (nonatomic,strong) NSNumber *isPicFilm;

@end
