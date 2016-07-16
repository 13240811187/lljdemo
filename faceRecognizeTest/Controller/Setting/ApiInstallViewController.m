//
//  ApiInstallViewController.m
//  faceRecognizeTest
//
//  Created by Crab on 16/1/16.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import "ApiInstallViewController.h"

@interface ApiInstallViewController ()
@property (nonatomic,strong) UITextView *textView;
@end

@implementation ApiInstallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)textViewInstall {
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.center.y)];
    self.textView.backgroundColor = [UIColor lightGrayColor];
    self.textView.textColor = [UIColor blackColor];
    self.textView.textAlignment = NSTextAlignmentCenter;
    self.textView.scrollEnabled = YES;
    self.textView.font = [UIFont systemFontOfSize:15];
    self.textView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.textView.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.textView];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    CGPoint center = self.view.center;
    center.y += 40;
    button.center = center;
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"确认修改" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(jumpToMainViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)jumpToMainViewController:(NSString *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
