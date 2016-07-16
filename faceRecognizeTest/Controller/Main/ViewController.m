//
//  ViewController.m
//  faceRecognizeTest
//
//  Created by Crab on 15/12/21.
//  Copyright © 2015年 Crab. All rights reserved.
//

#import "ViewController.h"
#import "CapedViewController.h"
#import "imagesShowViewController.h"
#import "RESideMenu.h"
#import "normalUserController.h"
#import "IdPhotoController.h"
#import "OCRUserController.h"
#import "similiarityViewController.h"
#import "modelTools.h"



#define ImageHeight self.view.frame.size.height/2
#define VerticalBoundary self.view.frame.size.width/10
#define VerticalRange self.view.frame.size.width/20
#define HorizontalBoundary self.view.frame.size.width/20
#define ButtonHeight (ImageHeight - 2*VerticalBoundary -2*VerticalRange )/3
#define ButtonWidth (self.view.frame.size.width - 2*HorizontalBoundary)
#define ScreenWidth self.view.frame.size.width


@interface ViewController ()<UITextFieldDelegate>
{
    UITextView *XMLtextView;

}
//长按以后弹出的输入框
@property (nonatomic,strong) UITextField *hostAddressTextField;
//配置文件地址
@property (nonatomic,strong) NSString *plistPath;
@property (nonatomic,strong) NSString *hostAddress;
@end

@implementation ViewController
-(NSString *)hostAddress {
    if (!_hostAddress) {
        if ( [[NSDictionary dictionaryWithContentsOfFile:self.plistPath] objectForKey:@"hostAddress"] != nil) {
            _hostAddress = [[NSDictionary dictionaryWithContentsOfFile:self.plistPath] objectForKey:@"hostAddress"];
        } else {
            
        _hostAddress = @"http://192.168.10.99:8081/faceTokenDemo/service/FaceToken";
        }
    }
    return _hostAddress;
}

-(NSString *)plistPath {
    if (!_plistPath) {
        _plistPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"similarityPlist.plist"];
    }
    return _plistPath;
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setImageView];
    [self setRegisterButton];
    [self setLogButton];
    [self setLeftButton];
    [self setTextField];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    
    
    
//    if (self.textField.text.length == 0) {
//        NSFileManager *manager = [NSFileManager defaultManager];
//        [manager removeItemAtPath:self.userIDPlistPath error:nil];
//    }
//    
    
}
-(void)viewWillDisappear:(BOOL)animated {

    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}
#pragma mark -- 输入框动画
-(void)hideKeyboard:(NSNotification*)noti{
  
    UIViewAnimationOptions option = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey]intValue];
    NSTimeInterval duration = [noti.userInfo[ UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
      CGRect textFieldFrame = self.textField.frame;
    
    textFieldFrame.origin.y = ImageHeight + VerticalBoundary;
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        self.textField.frame = textFieldFrame;
    } completion:nil];

}
-(void)showKeyboard:(NSNotification*)noti{
    NSLog(@"userInfo %@",noti.userInfo);
    CGRect endFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //键盘弹起时的动画效果
    UIViewAnimationOptions option = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey]intValue];
    //键盘动画时长
    NSTimeInterval duration = [noti.userInfo[ UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
       CGRect textFieldFrame = self.textField.frame;
    textFieldFrame.origin.y = endFrame.origin.y - textFieldFrame.size.height;
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        self.textField.frame = textFieldFrame;
    } completion:nil];
}


- (void)setLeftButton {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 60, 60)];
    imageView.layer.frame = CGRectMake(5, 5, 60, 60);
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 30;
    //imageView.backgroundColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"0753d169317db32989eaad9fa9978fc2"];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    [button addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    
    [button addSubview:imageView];
    [self.view addSubview:button];
}




#pragma --- setImageView 
- (void)setImageView {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ImageHeight)];
    imageView.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:imageView];
}

#pragma --- setTextField
- (void)setTextField {
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, ButtonWidth, ButtonHeight)];
    self.textField.keyboardType = UIKeyboardTypeAlphabet;
    self.textField.text = @"";
    CGPoint center = self.view.center;
    center.y = ImageHeight + VerticalBoundary + ButtonHeight/2;
    self.textField.center = center;
    self.textField.placeholder = @"请输入用户名:";
    self.textField.backgroundColor = [UIColor lightGrayColor];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
   self.textField.delegate = self;
    [self.textField addTarget:self action:@selector(touchesBegan:withEvent:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.textField addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventEditingDidEnd];
    
    
    [self.view addSubview:self.textField];

}
#pragma mark ---  输入框输入完毕发送通知
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"postUserName" object:nil userInfo:@{@"userName":textField.text}];


}
#pragma ---- setStartButton
-(void)setLogButton{
    UIButton *registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ButtonWidth, ButtonHeight)];
    CGPoint center = self.view.center;
    center.y = ImageHeight + VerticalBoundary + ButtonHeight*3/2 + VerticalRange;
    registerBtn.center = center;
    [registerBtn setTitle:@"登陆" forState:UIControlStateNormal];
    registerBtn.titleLabel.textColor = [UIColor blackColor];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:22];
    registerBtn.backgroundColor = [UIColor lightGrayColor];
    registerBtn.layer.cornerRadius = 10;
    
    [registerBtn addTarget:self action:@selector(userLogIn) forControlEvents:UIControlEventTouchUpInside];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture:)];
    longPress.minimumPressDuration = 1;
    [registerBtn addGestureRecognizer:longPress];
    
    
    [self.view addSubview:registerBtn];
    
}
- (void)longPressGesture:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self hostAddressInstall];
        
    }
}
- (void)setRegisterButton {
    
    UIButton *logButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 110, self.view.frame.size.height - 50, 100, 40)];
    logButton.backgroundColor = [UIColor clearColor];
    [logButton setTitle:@"新用户注册" forState:UIControlStateNormal];
    
    [logButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal]
    ;
    [logButton addTarget:self action:@selector(junpToRegisterTabBarCotroller) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logButton];

    

}
/**
 跳转到注册TabBarController
 */
- (void)junpToRegisterTabBarCotroller {
    normalUserController *normalUser = [[normalUserController alloc]init];
    IdPhotoController *idUser = [IdPhotoController new];
    OCRUserController *ocrUser = [OCRUserController new];
    
    UITabBarController *tabBarController = [UITabBarController new];
    tabBarController.viewControllers = @[normalUser,idUser,ocrUser];
   
    normalUser.title = @"普通注册";
    idUser.title = @"生活照注册";
    ocrUser.title = @"OCR注册";
    //标题文字大小以及位置调整
    [normalUser.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
    [normalUser.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -10)];
    
    [idUser.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
    [idUser.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -10)];
    
    [ocrUser.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
    [ocrUser.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -10)];
    
    
    [self.navigationController pushViewController:tabBarController animated:YES];
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}
- (void)hostAddressInstall {
        
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"服务器地址未配置" message:@"请重新配置您的服务器地址" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
      textField.placeholder = @"服务器地址";
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.backgroundColor = [UIColor lightGrayColor];
        textField.keyboardType = UIKeyboardTypeWebSearch;
        textField.text =self.hostAddress;
        if ([[modelTools readDataFromPlist:self.plistPath] objectForKey:@"hostAddress"]!=nil) {
            NSString *hostAddress = [[modelTools readDataFromPlist:self.plistPath] objectForKey:@"hostAddress"];
            [textField setText:hostAddress];
         
        }
        self.hostAddressTextField = textField;
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定修改" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (self.hostAddressTextField.text.length > 0) {
            
            NSDictionary *hostAddressDic =[modelTools readDataFromPlist:self.plistPath];
            [hostAddressDic setValue:self.hostAddressTextField.text forKey:@"hostAddress"];
            [hostAddressDic writeToFile:self.plistPath atomically:YES];
            
            similiarityViewController *svc = [similiarityViewController new];
            svc.hostAddress = self.hostAddressTextField.text;
            
        }
       
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    


}
/**
 用户登录/注册
 */
- (void)userLogIn
{
    NSLog(@"输入框内容：%@",self.textField.text);
    //如果用户名不为空 跳转到人脸采集界面
    if (self.textField.text.length > 0 ) {
        CapedViewController *capVC = [[CapedViewController alloc]init];
        capVC.xmlSTR = @"<param><imgWidth>360</imgWidth><imgHeight>440</imgHeight><imgCompress>85</imgCompress><pupilDistMin>100</pupilDistMin><pupilDistMax>300</pupilDistMax><isActived>2</isActived><isAudio>1</isAudio><timeOut>30</timeOut><version>v1.1.4</version><deviceIdx>0</deviceIdx><definitionAsk>30</definitionAsk><cryptType>0</cryptType><interfaceType>0</interfaceType><cryptKey>37010519820902167800</cryptKey><action>3</action><headLeft>-12</headLeft><headRight>15</headRight><headLow>-12</headLow><headHigh>10</headHigh><eyeDegree>25</eyeDegree><mouthDegree>25</mouthDegree></param>";
        
        [self.navigationController pushViewController:capVC animated:NO];
        capVC.userName = self.textField.text;
    } else if (self.textField.text.length > 0 && self.hostAddressTextField.text.length > 0 ){
        [self hostAddressInstall];
    
    }
    //用户名为空的话，弹出提示框，重写输入用户名
    else {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"用户名不能为空" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:okAction];
        [self presentViewController:alertVC animated:YES completion:nil];
    }
  

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
