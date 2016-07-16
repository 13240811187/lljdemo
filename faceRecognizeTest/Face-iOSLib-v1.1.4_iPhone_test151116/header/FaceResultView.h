//
//  FaceResultView.h
//  YYFaceWidget
//
//  Created by jinkeke@techshino.com on 14-9-5.
//  Copyright (c) 2014年 com.techshino. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    您可以自定义图片的显示位置，及大小
    为了保证图片的显示质量，我们建议你显示图片视图的宽高比是 1:1 比如：宽150 高150
*/

@interface FaceResultView : UIView


/**
    在控件显示图片结果
    请注意加密解密的 流水号，证件号，要保持一致
 */
- (void)showImageWith:(NSString *)base64Data customSpec:(NSString *)customSpecData serialNo:(NSString *)serailNo;


/**
    控件显示加密图片结果，
    以下的解密支持 控件使用 加密因子方式，cryptKey
 */
- (void)showImageWith:(NSString *)base64Data cryptKey:(NSString *)cryptKey serialNo:(NSString *)serailNo;


@end
