//
//  IdPhotoController.m
//  faceRecognizeTest
//
//  Created by Crab on 16/1/8.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import "IdPhotoController.h"
#import "webServiceManager.h"
#import "CapedViewController.h"
#import "modelTools.h"

#define  textFieldCount 3
@interface IdPhotoController ()
/**背景图片层*/
@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UIButton *button;

@property (nonatomic,strong) UITextField *registerIdTextField;
@property (nonatomic,strong) UITextField *realNameTextField;
@property (nonatomic,strong) UITextField *certNoTextField;
@end

@implementation IdPhotoController

-(UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backgroundImageView.image= [UIImage imageNamed:@"Stars"];
    }
    return _backgroundImageView;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.alpha = 0.6;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.backgroundImageView];
    [self setTextFields];
    [self setButtons];
    
}


- (void)setTextFields{
    for (int i = 0; i < textFieldCount; i++) {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 64 + 60*i , self.view.frame.size.width - 20*2, 50)];
        textField.layer.cornerRadius = 5;
        textField.borderStyle =  UITextBorderStyleRoundedRect;
        textField.backgroundColor = [UIColor lightGrayColor];
        switch (i) {
            case 0:
                textField.placeholder = @"用户名";
                textField.keyboardType = UIKeyboardTypeASCIICapable;
                 textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
                self.registerIdTextField = textField;
                break;
            case 1:
                textField.placeholder = @"姓名 *";
                self.realNameTextField = textField;
                break;
            case 2:
                
                textField.placeholder = @"身份证号 *";
                textField.keyboardType = UIKeyboardTypeASCIICapable;
               
                self.certNoTextField = textField;
                break;
                
            default:
                break;
        }
        [self.view addSubview:textField];
    }
}
- (void)setButtons {
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    
    self.button.center = self.view.center;
    [self.button setTitle:@"拍照并注册" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor redColor];
    self.button.layer.cornerRadius = 5;
   
    [self.button addTarget:self action:@selector(doCameraAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.button];

}

- (void)doCameraAction {
    NSString *title = @"";
    NSString *message = @"";
    
    if (self.realNameTextField.text.length > 0 && [modelTools validateIdentityCard:self.certNoTextField.text]) {
        CapedViewController *capVC = [[CapedViewController alloc]init];
        capVC.xmlSTR = @"<param><imgWidth>360</imgWidth><imgHeight>440</imgHeight><imgCompress>85</imgCompress><pupilDistMin>100</pupilDistMin><pupilDistMax>300</pupilDistMax><isActived>2</isActived><isAudio>1</isAudio><timeOut>30</timeOut><version>v1.1.4</version><deviceIdx>0</deviceIdx><definitionAsk>30</definitionAsk><cryptType>0</cryptType><interfaceType>0</interfaceType><cryptKey>37010519820902167800</cryptKey><action>3</action><headLeft>-12</headLeft><headRight>15</headRight><headLow>-12</headLow><headHigh>10</headHigh><eyeDegree>25</eyeDegree><mouthDegree>25</mouthDegree></param>";
        capVC.registerUserId = self.registerIdTextField.text;
        capVC.realName = self.realNameTextField.text;
        capVC.certNo = self.certNoTextField.text;
        
        [self.navigationController pushViewController:capVC animated:YES];
        //[self presentViewController:capVC animated:YES completion:nil];
        return;

    } else if (self.realNameTextField.text.length == 0 || self.certNoTextField.text.length == 0){
        title = @"请重新输入";
        message = @"姓名和身份证号不能为空";
    } else {
        title = @"请重新输入";
        message = @"身份证号码格式有误";
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:NO completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (void)idPhotoUserRegister {
#warning 公安部底片注册
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
