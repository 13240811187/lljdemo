//
//  OCRUserController.m
//  faceRecognizeTest
//
//  Created by Crab on 16/1/8.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import "OCRUserController.h"
#import "ViewScan.h"
#import "Globaltypedef.h"
#import "SCCaptureCameraController.h"
#import "modelTools.h"
#import "webServiceManager.h"


#define textFieldCount 8
#define boundary 20
#define textFieldHeight (self.view.frame.size.width/15 +10)


#define space self.view.frame.size.width/48

#define buttonCount 2
#define buttonHeight 40
#define miniBoundary 15

@interface OCRUserController ()<ViewScanDelegate,SCNavigationControllerDelegate>
/**背景图片层*/
@property (nonatomic,strong)UIImageView *backgroundImageView;
/**滚动图层*/
@property (nonatomic,strong) UIScrollView *scrollView;

@property (strong, nonatomic) ViewScan *viewscan;
/**OCR视图控制器 */
@property (nonatomic,strong) SCCaptureCameraController *con ;

@property (nonatomic,strong) UITextField *registerIdTextField;
@property (nonatomic,strong) UITextField *realNameTextField;
@property (nonatomic,strong) UITextField *sexTextField;
@property (nonatomic,strong) UITextField *folkTextField;
@property (nonatomic,strong) UITextField *birthdayTextField;
@property (nonatomic,strong) UITextField *addressTextField;
@property (nonatomic,strong) UITextField *certNoTextField;
@property (nonatomic,strong) UITextField *issueTextField;
@property (nonatomic,strong) UITextField *periodTextField;

@property (nonatomic,strong) UIImageView *faceImageView;
@property (nonatomic,strong) UIImageView *foregroundPhoto;
@property (nonatomic,strong) UIImageView *backgroundPhoto;
@property (nonatomic,strong) UIImage *cardImage;
@property (nonatomic,strong) NSMutableArray *photos;

@property (nonatomic,strong) UIActivityIndicatorView *activityIndicatorView;


@end

@implementation OCRUserController
- (UIActivityIndicatorView *)activityIndicatorView {
    if (!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        _activityIndicatorView.center = self.view.center;
        _activityIndicatorView.backgroundColor = [UIColor clearColor];
        _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        
    }
    return _activityIndicatorView;
}
-(NSMutableArray *)photos {
    if (!_photos) {
        _photos = [NSMutableArray array];
    }
    return _photos;
}
-(UIScrollView *)scrollView {
    if (!_scrollView) {

        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height/2 + boundary)];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width,self.view.frame.size.height - 2*boundary);
        _scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    }
    return _scrollView;

}
-(UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backgroundImageView.image= [UIImage imageNamed:@"Stars"];
    }
    return _backgroundImageView;
}

#pragma 视图生命周期
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.alpha = 0.6;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.backgroundImageView];
    [self setTextFields];
    
    [self setRegisterButtonJumpOCRButton];
    [self setFaceImageAndTwoIdCardPhotos];
    [self.view addSubview:self.scrollView];
    
    
}

- (void)jumpToCaptureCameraController {
    self.con.scNaigationDelegate = self;
    self.con.iCardType = TIDCARD2;
    self.con.isDisPlayTxt = YES;
    
    [self presentViewController:self.con animated:YES completion:NULL];
}

#pragma OCR界面设置及代理方法
- (void)setOCRRelatedValues {

}

-(SCCaptureCameraController *)con {
    if (!_con) {
        _con = [[SCCaptureCameraController alloc]init];
        _con.isStatusBarHiddenBeforeShowCamera = NO;
        
    }
    return _con;
}
/**
 获取身份证正面信息
 */
- (void)sendIDCValue:(NSString *)name SEX:(NSString *)sex FOLK:(NSString *)folk BIRTHDAY:(NSString *)birthday ADDRESS:(NSString *) address NUM:(NSString *)num
{
    NSLog(@"idc  = %@\n%@\n%@\n%@\n%@\n%@\n",name,sex,folk,birthday,address,num);
//将提取到的信息分别赋值给对应的textfield
    self.realNameTextField.text = name;
    self.sexTextField.text = sex;
    self.folkTextField.text = folk;
    self.birthdayTextField.text = birthday;
    self.addressTextField.text = address;
    self.certNoTextField.text = num;
    if (name!=nil && sex!=nil && folk!=nil && birthday!=nil && address!=nil && num!=nil) {
        self.foregroundPhoto.image = self.cardImage;
    }

}
/**
 获取身份证反面信息
 */
- (void)sendIDCBackValue:(NSString *)issue PERIOD:(NSString *) period
{
    NSLog(@"idcback  = %@\n%@\n",issue,period);
    self.issueTextField.text = issue;
    self.periodTextField.text = period;
    if (issue != nil && period != nil) {
        self.backgroundPhoto.image = self.cardImage;
    }
}
/**
 获取身份证头像图片
 */
- (void)sendCardFaceImage:(UIImage *)image
{
    if (image != NULL) {
        NSLog(@"headiamge = %@\n",image);
        self.faceImageView.image = image;
        
    }
    
}
/**
 获取拍照图片
 */
- (void)sendTakeImage:(TCARD_TYPE) iCardType image:(UIImage *)cardImage
{
    self.cardImage = cardImage;
    NSLog(@"sendTakeImage = %d %@\n",iCardType,cardImage);
   
}

#pragma 视图界面搭建
- (void)setTextFields{
   
    for (int i = 0; i < textFieldCount; i++) {
        
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(boundary, boundary + textFieldHeight*i + space*i , self.view.frame.size.width - 20*2, textFieldHeight)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.backgroundColor = [UIColor lightGrayColor];
        NSArray *placeholders = @[@"用户名",@"姓名*",@"性别",@"生日",@"地址",@"身份证号*",@"签发机关",@"有效期*"];
        textField.placeholder = placeholders[i];
        textField.text = nil;
        [textField addTarget:self action:@selector(touchesBegan:withEvent:) forControlEvents:UIControlEventEditingDidEndOnExit];
        textField.adjustsFontSizeToFitWidth = YES;
        switch (i) {
            case 0:
                textField.frame = CGRectMake(boundary, boundary + textFieldHeight*i + space*i , self.view.center.x - 2*boundary, textFieldHeight);
                textField.keyboardType = UIKeyboardTypeASCIICapable;
                self.registerIdTextField = textField;
                break;
            case 1:
                textField.frame = CGRectMake(boundary, boundary + textFieldHeight*i + space*i , self.view.center.x - 2*boundary, textFieldHeight);
                textField.keyboardType = UIKeyboardTypeASCIICapable;
                self.realNameTextField = textField;
                break;
            case 2:
                
                textField.frame = CGRectMake(boundary, boundary + textFieldHeight*i + space*i , self.registerIdTextField.frame.size.width/2 - space/2, textFieldHeight);
                textField.keyboardType = UIKeyboardTypeASCIICapable;
                self.sexTextField = textField;
                [self createFolkTextField];
                break;

            case 3:
                textField.frame =  textField.frame = CGRectMake(boundary,boundary + textFieldHeight*i + space*i , self.view.center.x - 2*boundary, textFieldHeight);
                [textField setFont:[UIFont systemFontOfSize:13]];
               self.birthdayTextField= textField;
                break;
            case 4:
              //  [textField setAdjustsFontSizeToFitWidth:YES];
                [textField setFont:[UIFont systemFontOfSize:12]];
                
                self.addressTextField = textField;
                
                break;
            case 5:
                
                self.certNoTextField = textField;
                break;
            case 6:
                
                self.issueTextField = textField;
                break;
            case 7:
                
                self.periodTextField = textField;
                break;
            
            default:
                break;
        }
        [self.scrollView addSubview:textField];
    }
}
/**
 设置‘民族’输入框
 */
- (void)createFolkTextField {
    UITextField *folkTextField = [[UITextField alloc]initWithFrame:CGRectMake(boundary + self.sexTextField.frame.size.width + space,self.sexTextField.frame.origin.y,self.sexTextField.frame.size.width, textFieldHeight)];
    folkTextField.placeholder = @"民族";
    folkTextField.backgroundColor = [UIColor lightGrayColor];
    folkTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.folkTextField = folkTextField;
    [self.scrollView addSubview:self.folkTextField];
}

- (void)setFaceImageAndTwoIdCardPhotos {
    self.faceImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.center.x/2*3 - (4*textFieldHeight + 3*space)/8*3 , boundary,(4*textFieldHeight + 3*space)/4*3 , 4*textFieldHeight + 3*space)];
//    CGPoint center = self.view.center;
//    center.x = center.x/2*3;
//    
//    self.faceImageView.center = center;
    self.faceImageView.image = [UIImage imageNamed:@"placeHolder"];
    self.faceImageView.layer.cornerRadius = 5;
    self.faceImageView.layer.masksToBounds = YES;
    [self.scrollView addSubview:self.faceImageView];
    
    for (int i = 0; i < 2; i++) {
        UIImageView *Photo = [[UIImageView alloc]initWithFrame:CGRectMake(boundary+i*(self.view.center.x-boundary-miniBoundary/2)+miniBoundary*i, 2*boundary + textFieldCount*textFieldHeight + space*textFieldCount,self.view.center.x -boundary-miniBoundary/2, (self.view.center.x -boundary-miniBoundary/2)/4*3)];
        Photo.backgroundColor = [UIColor blackColor];
        Photo.layer.cornerRadius = 5;
        Photo.layer.masksToBounds = YES;
        if (i == 1) {
            self.foregroundPhoto = Photo;
        } else {
            self.backgroundPhoto = Photo;
        }
        [self.scrollView addSubview:Photo];
        
    }

}

- (void)setRegisterButtonJumpOCRButton {
    
    for (int i = 0; i < buttonCount ; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0,0,200,buttonHeight)];
        CGPoint center = self.view.center;
        center.y =  self.view.center.y/2*3 + space*i + buttonHeight *i;
        button.center = center;
        button.layer.cornerRadius = 5;
        NSArray *buttonTitles = @[@"拍摄身份证",@"确认注册"];
        button.backgroundColor = [UIColor redColor];
        [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
        switch (i) {
            case 0:
                [button addTarget:self action:@selector(jumpToCaptureCameraController) forControlEvents:UIControlEventTouchUpInside];
                break;
              case 1:
                [button addTarget:self action:@selector(registerIdPhotoUser) forControlEvents:UIControlEventTouchUpInside];
                break;
            default:
                break;
        }
        
        [self.view addSubview:button];
    }
    
}
- (void)registerIdPhotoUser {
    
    BOOL isSuccess = [modelTools validateIdentityCard:self.certNoTextField.text];
   NSString *title = @"";
    NSString *message = @"";
    if (self.realNameTextField.text==nil || self.sexTextField.text==nil || self.folkTextField.text==nil ||  self.birthdayTextField.text==nil||  self.addressTextField.text==nil ||  isSuccess==NO || self.issueTextField.text.length==0 || self.periodTextField.text.length == 0) {
        
    
       if (self.realNameTextField.text==nil || self.sexTextField.text==nil || self.folkTextField.text==nil ||  self.birthdayTextField.text==nil||  self.addressTextField.text==nil ||  isSuccess==NO ) {
        title = @"正面信息不完整";
        message = @"请重新拍摄身份证正面照片";

        
      } else if (self.issueTextField.text.length==0 || self.periodTextField.text.length == 0){
        title = @"反面信息不完整";
        message = @"请重新拍摄身份证反面照片";
        
       
    }
        UIAlertController *alertControllerr = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:1];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self presentViewController:self.con animated:YES completion:nil];
        }];
        [alertControllerr addAction:okAction];
        
        [self presentViewController:alertControllerr animated:YES completion:nil];
        
    } else {
        
        [self.activityIndicatorView startAnimating];
        //OCR信息完整，注册
        webServiceManager *manager = [webServiceManager new];
   
        NSDictionary *responseDic =  [manager ocrRegisterWithIdentifyWithUserId:self.registerIdTextField.text andRealName:self.realNameTextField.text andSex:self.sexTextField.text andFolk:self.folkTextField.text andBirthday:self.birthdayTextField.text andAddress:self.addressTextField.text andCertNum:self.certNoTextField.text andIssue:self.issueTextField.text andPeriod:self.periodTextField.text andImageB64:[modelTools encodeImageToB64Str:self.faceImageView.image]];
        NSString *errorCode = [responseDic objectForKey:@"errorCode"];
        if ([errorCode isEqualToString:@"00000"]) {
            title = @"登陆成功";
            message = [NSString stringWithFormat:@"用户名:%@",[responseDic objectForKey:@"userId"]];
            
        } else {
            title = @"登陆失败";
            message = [NSString stringWithFormat:@"错误码:%@",errorCode];
        }
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:okAction];
        
        [self.activityIndicatorView stopAnimating];
        
        [self presentViewController:alertController animated:YES completion:nil];
    
    
    }
    
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.scrollView endEditing:YES];
 
}


@end
