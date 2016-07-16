//
//  similiarityViewController.m
//  faceRecognizeTest
//
//  Created by Crab on 15/12/31.
//  Copyright © 2015年 Crab. All rights reserved.
//

#import "similiarityViewController.h"
#import "RESideMenu.h"
#import "modelTools.h"

#define LabelCount 4
#define liveLive 50.00
#define liveId 50.00
#define liveOCR 50.00
#define IdOCR 50.00

#define API @"192.168.10.99:8081"

#warning tag 1~4 已经被占用
@interface similiarityViewController ()<UITextFieldDelegate>


@property (nonatomic,strong) UISlider *firstSlider;
@property (nonatomic,strong) UISlider *secondSlider;
@property (nonatomic,strong) UISlider *thirdSlider;
@property (nonatomic,strong) UISlider *forthSlider;

@property (nonatomic,assign) NSInteger firstValue;
@property (nonatomic,assign) NSInteger secondValue;
@property (nonatomic,assign) NSInteger thirdValue;
@property (nonatomic,assign) NSInteger forthValue;

@property (nonatomic,strong) UITextField *hostAddressTextField;

@end

@implementation similiarityViewController
- (NSString *)plistPath {
    if (!_plistPath) {
        _plistPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"similarityPlist.plist"];
    }
    return _plistPath;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationController.navigationBar.alpha = 0.6;
    self.navigationController.navigationBar.topItem.title = @"参数设置";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"< Back" style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
    [self setLabelsAndSliders];
    [self setApiTextField];
    [self writeToFile];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    
    
}
- (void)showKeyboard:(NSNotification *)noti{
    CGRect endFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //键盘弹起时的动画效果
    UIViewAnimationOptions option = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey]intValue];
    //键盘动画时长
    NSTimeInterval duration = [noti.userInfo[ UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    CGRect textFieldFrame = self.hostAddressTextField.frame;
    textFieldFrame.origin.y = endFrame.origin.y - textFieldFrame.size.height;
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        self.hostAddressTextField.frame = textFieldFrame;
    } completion:nil];

}
- (void)hideKeyboard:(NSNotification *)noti{
    UIViewAnimationOptions option = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey]intValue];
    NSTimeInterval duration = [noti.userInfo[ UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    CGRect textFieldFrame = self.hostAddressTextField.frame;
    textFieldFrame.origin.y = self.view.center.y + 40;
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        self.hostAddressTextField.frame = textFieldFrame;
    } completion:nil];
}
- (void)writeToFile {
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(viewDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:self.plistPath]) {
        [self readDataFromPlist];
    } else {
        NSDictionary *similarityDic = @{@"liveLive":[NSString stringWithFormat:@"%ld",(long)liveLive],@"liveIdentity":[NSString stringWithFormat:@"%ld",(long)liveId],@"liveOCR":[NSString stringWithFormat:@"%ld",(long)liveOCR],@"identityOCR":[NSString stringWithFormat:@"%ld",(long)IdOCR],@"hostAddress":self.hostAddressTextField.text};
        [similarityDic writeToFile:self.plistPath atomically:YES];
    }

}
-(void)viewWillDisappear:(BOOL)animated {

     NSDictionary *similarityDic = @{@"liveLive":[NSString stringWithFormat:@"%ld",(long)self.firstValue],@"liveIdentity":[NSString stringWithFormat:@"%ld",(long)self.secondValue],@"liveOCR":[NSString stringWithFormat:@"%ld",(long)self.thirdValue],@"identityOCR":[NSString stringWithFormat:@"%ld",(long)self.forthValue],@"hostAddress":self.hostAddressTextField.text};
    [similarityDic writeToFile:self.plistPath atomically:YES];
}
- (void)viewDidEnterBackground {
   
     NSDictionary *similarityDic = @{@"liveLive":[NSString stringWithFormat:@"%ld",(long)self.firstValue],@"liveIdentity":[NSString stringWithFormat:@"%ld",(long)self.secondValue],@"liveOCR":[NSString stringWithFormat:@"%ld",(long)self.thirdValue],@"identityOCR":[NSString stringWithFormat:@"%ld",(long)self.forthValue],@"hostAddrss":self.hostAddressTextField.text};
    [similarityDic writeToFile:self.plistPath atomically:YES];
    
}
/**
 从配置文件中读取用户数据
 */
- (void)readDataFromPlist {
    NSDictionary *dic = [modelTools readDataFromPlist:self.plistPath];
        self.firstSlider.value = [[dic objectForKey:@"liveLive"] integerValue];
        self.secondSlider.value = [[dic objectForKey:@"liveIdentity"] integerValue];
        self.thirdSlider.value = [[dic objectForKey:@"liveOCR"]integerValue];
        self.forthSlider.value = [[dic objectForKey:@"identityOCR"]integerValue];
        [self updateFirstLabelValue:self.firstSlider];
        [self updateSecondLabelValue:self.secondSlider];
        [self updateThirdLabelValue:self.thirdSlider];
        [self updateForthLabelValue:self.forthSlider];
    
    self.hostAddressTextField.text = [dic objectForKey:@"hostAddress"];
  
}
/**
 设置服务器端口输入框
 */
- (void)setApiTextField {
   self.hostAddressTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 2*20, 40)];
    CGPoint center = self.view.center;
    center.y += 40;
    
    self.hostAddressTextField.center = center;
    
    self.hostAddressTextField.backgroundColor = [UIColor lightGrayColor];
    self.hostAddressTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.hostAddressTextField.placeholder = @"服务器端口号";
    self.hostAddressTextField.keyboardType = UIKeyboardTypeWebSearch;
    self.hostAddressTextField.returnKeyType = UIReturnKeyDone;

   
    self.hostAddressTextField.text = API;
    
    
    [self.hostAddressTextField addTarget:self action:@selector(touchesBegan:withEvent:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:self.hostAddressTextField];
    
}

- (void)setLabelsAndSliders {
    for (int i = 0; i < LabelCount; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, i*60 + 64, 200, 60)];
        
       UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(150, i * 60  + 64, self.view.frame.size.width - 150, 60)];
        //label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.opaque = NO;
        
        label.tag = i+1;
        
        switch (i) {
            case 0:
                label.text = @"生活照x生活照:50%";
                self.firstSlider = slider;
                self.firstSlider.minimumValue = 0;
                self.firstSlider.maximumValue = 100;
                self.firstSlider.value = liveLive;
                [self.firstSlider addTarget:self action:@selector(updateFirstLabelValue:) forControlEvents:UIControlEventValueChanged];
                break;
            case 1:
                label.text = @"生活照x身份证:60%";
                self.secondSlider = slider;
                _secondSlider.minimumValue = 0;
                _secondSlider.maximumValue = 100;
                _secondSlider.value = liveId;
                [self.secondSlider addTarget:self action:@selector(updateSecondLabelValue:) forControlEvents:UIControlEventValueChanged];
                break;
            case 2:
                label.text = @"生活照xOCR:70%";
                _thirdSlider = slider;
                _thirdSlider.minimumValue = 0;
                _thirdSlider.maximumValue = 100;
                _thirdSlider.value = liveOCR;
                [self.thirdSlider addTarget:self action:@selector(updateThirdLabelValue:) forControlEvents:UIControlEventValueChanged];
                
                break;
            case 3:
                label.text = @"身份证xOCR:80%";
                _forthSlider = slider;
                _forthSlider.minimumValue = 0;
                _forthSlider.maximumValue = 100;
                _forthSlider.value = IdOCR;
                [self.forthSlider addTarget:self action:@selector(updateForthLabelValue:) forControlEvents:UIControlEventValueChanged];
                break;
                
            default:
                break;
        }
        [self.view addSubview:label];
        [self.view addSubview:slider];
    }
    


}

- (void)updateFirstLabelValue:(UISlider *)slider{
    
    UILabel *Label = (UILabel *)[self.view viewWithTag:1];
    if (slider.value >= liveLive) {
        Label.text = [NSString stringWithFormat:@"生活照x生活照:%.0f%%",slider.value];
        NSArray *values = [NSArray array];
        values = [values arrayByAddingObject:[NSNumber numberWithInteger:slider.value]];
        self.firstValue = [[values lastObject] integerValue] ;
    } else {
        slider.value = liveLive;
        self.firstValue = liveLive;
        Label.text = [NSString stringWithFormat:@"生活照x生活照:%.0f%%",liveLive];
    }
    
}
- (void)updateSecondLabelValue:(UISlider *)slider{
    
    UILabel *Label = (UILabel *)[self.view viewWithTag:2];
    if (slider.value >= liveId) {
        Label.text = [NSString stringWithFormat:@"生活照x身份证:%.0f%%",slider.value];
        NSArray *values = [NSArray array];
        values = [values arrayByAddingObject:[NSNumber numberWithInteger:slider.value]];
        self.secondValue = [[values lastObject] integerValue] ;
    } else {
        slider.value = liveId;
        self.secondValue = liveId;
        Label.text = [NSString stringWithFormat:@"生活照x身份证:%.0f%%",liveId];
    }
    
}
- (void)updateThirdLabelValue:(UISlider *)slider{
    
    UILabel *Label = (UILabel *)[self.view viewWithTag:3];
    if (slider.value >= liveOCR) {
        Label.text = [NSString stringWithFormat:@"生活照xOCR:%.0f%%",slider.value];
        NSArray *values = [NSArray array];
        values = [values arrayByAddingObject:[NSNumber numberWithInteger:slider.value]];
        self.thirdValue = [[values lastObject] integerValue] ;
    } else {
        slider.value = liveOCR;
        self.thirdValue = liveOCR;
        Label.text = [NSString stringWithFormat:@"生活照xOCR:%.0f%%",liveOCR];
    }
    
}
- (void)updateForthLabelValue:(UISlider *)slider{
    
    UILabel *Label = (UILabel *)[self.view viewWithTag:4];
    if (slider.value >= IdOCR) {
        Label.text = [NSString stringWithFormat:@"身份证xOCR:%.0f%%",slider.value];
        NSArray *values = [NSArray array];
        values = [values arrayByAddingObject:[NSNumber numberWithInteger:slider.value]];
        self.forthValue = [[values lastObject] integerValue] ;
    } else {
        slider.value = IdOCR;
        self.forthValue = IdOCR;
        Label.text = [NSString stringWithFormat:@"身份证xOCR:%.0f%%",IdOCR];
    }
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
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
