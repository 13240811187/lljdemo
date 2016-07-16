//
//  LeftViewController.m
//  faceRecognizeTest
//
//  Created by Crab on 15/12/30.
//  Copyright © 2015年 Crab. All rights reserved.
//

#import "LeftViewController.h"
#import "RESideMenu.h"
#import "ViewController.h"
#import "imagesShowViewController.h"
#import "similiarityViewController.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation LeftViewController
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, (self.view.frame.size.height - 60*4)/2, self.view.frame.size.width, 60*4) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        _tableView.opaque = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.bounces = NO;
        
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveNotification:) name:@"postUserName" object:nil];
   
   
  
}
- (void)receiveNotification:(NSNotification *)noti {
   self.userName =  [noti.userInfo objectForKey:@"userName"];
    NSLog(@"通知传值%@",self.userName);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc]initWithRootViewController:[ViewController new]]animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            if (self.userName.length > 0) {
                imagesShowViewController *imagesShowVC = [imagesShowViewController new];
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc]initWithRootViewController:imagesShowVC]];
                
                imagesShowVC.userName = self.userName;
                [self.sideMenuViewController hideMenuViewController];
            } else {
            
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc]initWithRootViewController:[ViewController new]]animated:YES];
                [self.sideMenuViewController hideMenuViewController];
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"用户名为空" message:@"请输入用户名" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
                [alertController addAction:okAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
            
            }
            
            break;
         case 2:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[similiarityViewController new]]];
            [self.sideMenuViewController hideMenuViewController];
            break;
        
        default:
            break;
    }

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont systemFontOfSize:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [UIView new];
    }
    if (indexPath.row == 3) {
        UISwitch *switchBtn = [[UISwitch alloc]initWithFrame:CGRectMake(160, 15, 100, 60)];
        [cell.contentView addSubview:switchBtn];
        cell.textLabel.highlightedTextColor = [UIColor whiteColor];
    }
    
    NSArray *titles = @[@"主界面", @"默认底片设置", @"参数设置",@"动态口令登陆"];
    cell.textLabel.text = titles[indexPath.row];
    //cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    
    return cell;
}




@end
