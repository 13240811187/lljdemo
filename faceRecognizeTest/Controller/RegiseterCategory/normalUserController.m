//
//  normalUserController.m
//  faceRecognizeTest
//
//  Created by Crab on 16/1/8.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import "normalUserController.h"
#import "ViewController.h"
#import "CapedViewController.h"
#import "webServiceManager.h"

#define  textFieldCount 3

@interface normalUserController ()
@property (nonatomic,strong)UIImageView *backgroundImageView;
/**用户名*/
@property (nonatomic,strong) UITextField *registerIdTextField;
/**姓名*/
@property (nonatomic,strong) UITextField *realNameTextField;
/**身份证号*/
@property (nonatomic,strong) UITextField *certNoTextField;
/**刷新小菊花*/
@property (nonatomic,strong) UIActivityIndicatorView *activityIndicatorView;


@end

@implementation normalUserController
-(UIActivityIndicatorView *)activityIndicatorView {
    if (!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        _activityIndicatorView.backgroundColor = [UIColor blueColor];
        _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
        _activityIndicatorView.center = self.view.center;
    }
    return _activityIndicatorView;

}

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
    [self setScreen];
    
    
}
//设置界面
- (void)setScreen {
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    
    button.center = self.view.center;
    [button setTitle:@"确认注册" forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(registerNormalUser) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    //将textfield循环添加到界面上 
    for (int i = 0; i < textFieldCount; i++) {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 64 + 60*i , self.view.frame.size.width - 20*2, 50)];
        textField.text = nil;
        textField.borderStyle =  UITextBorderStyleRoundedRect;
        textField.backgroundColor = [UIColor lightGrayColor];

        switch (i) {
            case 0:
                textField.placeholder = @"用户名";
                textField.keyboardType = UIKeyboardTypeASCIICapable;
                self.registerIdTextField = textField;
                break;
            case 1:
                textField.placeholder = @"姓名 *";
                self.realNameTextField = textField;
                break;
            case 2:
                textField.placeholder = @"身份证号 *";
                self.certNoTextField = textField;
                break;
                
            default:
                break;
        }
        [self.view addSubview:textField];
    }
}
//普通注册方法
- (void)registerNormalUser {
    //如果姓名输入框有内容且身份证号为18位（ps：应该使用正则式编码）
    if (self.realNameTextField.text.length > 0 && self.certNoTextField.text.length == 18) {
        [self.activityIndicatorView startAnimating];
        //调用webservice普通用户注册的方法
        webServiceManager *manager = [webServiceManager new];
       NSDictionary *responseDic = [manager createPoliceFaceUserWithUserId:self.registerIdTextField.text andRealName:self.realNameTextField.text andCertNum:self.certNoTextField.text];
        
        if (responseDic!=nil) {
            //如果注册失败，返回错误码
            [self.activityIndicatorView stopAnimating];
            NSString *title = @"";
            NSString *message = @"";
            
            NSString *errorCode = [responseDic objectForKey:@"errorCode"];
            if ([errorCode isEqualToString:@"000000"]) {
                title = @"注册成功";
                //注册成功，返回用户名
                message = [NSString stringWithFormat:@"%@",[responseDic objectForKey:@"userId"]]; 
                
            } else {
            title = @"登陆失败";
                message = [NSString stringWithFormat:@"错误码%@",errorCode];
            }
            [self.activityIndicatorView stopAnimating];
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            
        }
        
       
       //如果输入内容有空，提示用户信息输入
    } else if (self.realNameTextField.text.length == 0 || self.certNoTextField.text.length == 0){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请重新输入" message:@"姓名和身份证号不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancleAction];
        [self presentViewController:alertController animated:NO completion:nil];
        
    } else {
        //如果输入内容不合法，提示用户重新输入
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请重新输入" message:@"身份证号码格式有误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancleAction];
        [self presentViewController:alertController animated:NO completion:nil];
        
    }

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
