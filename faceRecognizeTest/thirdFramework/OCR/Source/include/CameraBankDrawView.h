//
//  CameraDrawView.h
//
//  Created by Magel on 10-12-20.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CameraBankDrawView : UIView {
	id delegate;
	UIColor *boundColor;
	BOOL beat;
}

@property (nonatomic, retain) id delegate;
@property(nonatomic,assign)CGPoint  beginPoint;
@property(nonatomic,assign)CGPoint endPoint;
@property(nonatomic,strong)UILabel *lable;
//-(CGPoint)getBeginPoint;
//-(CGPoint)getEndPoint;
-(void)showLineUP:(BOOL)up right:(BOOL)right bottom:(BOOL)bottom left:(BOOL)left;
@end
