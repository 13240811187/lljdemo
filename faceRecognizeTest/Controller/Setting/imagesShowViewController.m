//
//  imagesShowViewController.m
//  faceRecognizeTest
//
//  Created by Crab on 15/12/28.
//  Copyright © 2015年 Crab. All rights reserved.
//

#import "imagesShowViewController.h"
#import "RESideMenu.h"
#import "webServiceManager.h"
#import "CapedViewController.h"
#import "modelTools.h"
#import "imagesModel.h"
#import "imgGroup.h"
#import "ViewController.h"

@interface imagesShowViewController ()
@property (nonatomic,strong) NSArray *imageModelArray;
@property (nonatomic,strong) NSArray *imagesArray;

@property (nonatomic,strong) UISwitch *switchBtn;

/**
 checkmark单选
 */
@property (nonatomic,strong) NSMutableArray *selectedIndexPaths;
@property (nonatomic,strong) NSIndexPath *selectedPath;


@end

@implementation imagesShowViewController

-(NSArray *)imageModelArray {
    if (!_imageModelArray) {
        _imageModelArray = [NSArray array];
    }
        
    return _imageModelArray;
    
}



-(NSArray *)imagesArray {
    if (!_imagesArray) {
#warning 需要对imageArray重新初始化
            webServiceManager *manager = [webServiceManager new];
            NSDictionary *responseDic = [manager getUserPicturesBaseUserId:self.userName];
            if (responseDic != nil) {
                
                
              //  _imagesArray = [modelTools resovelImagesFromResponseDic:responseDic];
               NSArray *modelArray = [modelTools  imagesByResponseDic:responseDic];
                for (imagesModel *model in modelArray) {
                    NSLog(@"Model模型测试");
                    NSLog(@"faceId:%@,isDefault:%@,isPicture:%@",model.faceId,model.isDefault,model.isPicFilm);
                    
                  UIImage *image = [modelTools decodeImageFromB64Str:model.imgB64];
                    NSMutableArray *mutableArray = [NSMutableArray array];
                    [mutableArray addObject:image];
                    _imagesArray = [mutableArray copy];
                }
                
                
            } else {
                
                _imagesArray = [NSArray array];
            }

   
    
   }
    return _imagesArray;
}
-(UISwitch *)switchBtn {
    if (!_switchBtn) {
        _switchBtn = [[UISwitch alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 15, 100, 60)];
    }
    return _switchBtn;
}
- (NSMutableArray *)selectedIndexPaths {
    if (!_selectedIndexPaths) {
        _selectedIndexPaths = [NSMutableArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
    }
    return _selectedIndexPaths;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
   
   

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHeaderView];
    
    NSIndexPath *indexPath = self.selectedIndexPaths.lastObject;
    
   [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];

    [self getUserPictureAndReloadData];
    
   
    
  
}
- (void)getUserPictureAndReloadData {
    UIActivityIndicatorView *indicatorView = [UIActivityIndicatorView new];
    indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    indicatorView.backgroundColor = [UIColor blueColor];
    indicatorView.center = self.view.center;
    [self.view addSubview:indicatorView];
    [indicatorView startAnimating];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        webServiceManager *manager = [webServiceManager new];
        NSDictionary *responseDic = [manager getUserPicturesBaseUserId:self.userName];
        //判断用户名是否存在
        if ([[responseDic objectForKey:@"errorCode"]isEqualToString:@"000000"]) {
            _imageModelArray = [modelTools  imagesByResponseDic:responseDic];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [indicatorView stopAnimating];
                [self.tableView reloadData];
            });
        } else {
            //用户名不存在时调用获取图片方法弹出提示
           
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"用户名不存在" message:@"请重新注册" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
               //点击确定按钮界面跳转至主界面
               
             [self.sideMenuViewController setContentViewController:[[UINavigationController alloc]initWithRootViewController:[ViewController new]]animated:NO];
                
               
              
                
            }];
            
            [alertController addAction:okAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                [indicatorView stopAnimating];
                [self.tableView reloadData];
            });
        
        }
        
        
        
    });
}
- (void)setHeaderView {
    self.navigationController.navigationBar.alpha = 0.6;
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.topItem.title = @"照片列表";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"<Back" style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 100, 60)];
    
    [label setText:@"设置公安部照片为底片"];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:18];
    [bottomView addSubview:label];
    [bottomView addSubview:self.switchBtn];
    self.tableView.tableHeaderView = bottomView;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.imageModelArray.count == 0) {
        return 5;
    } else {
    return self.imageModelArray.count;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuseIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    

    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    if (self.imageModelArray.count == 0) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/4.5, (self.view.frame.size.height-44-60)/5)];
        imageView.image = [UIImage imageNamed:@"placeHolder"];
        [cell.contentView addSubview:imageView];
    } else {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/4.5, (self.view.frame.size.height-44-60)/5)];
       // imageView.image = self.imagesArray[indexPath.row];
        
        imgGroup *image = self.imageModelArray[indexPath.row];
       // NSLog(@"默认对比图片isDefault:%lu",(unsigned long)image.isDefault);
        if (image.isDefault.integerValue == 1) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
           cell.textLabel.text = @"默认对比图片";
            self.selectedPath = indexPath;
        } else {
            cell.accessoryType =UITableViewCellAccessoryNone;
            cell.textLabel.text = nil;
        }

        
        imageView.image = [modelTools decodeImageFromB64Str:image.imgB64];
        
        [cell.contentView addSubview:imageView];
    }
        return cell;
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSInteger currentRow = indexPath.row;
    NSLog(@"%ld",(long)currentRow);
    NSInteger oldRow = (_selectedPath != nil)?_selectedPath.row:-1;
    if (currentRow != oldRow /*&& self.switchBtn.isOn == NO*/) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.textLabel.text = @"默认对比图片";
   //设置默认对比图片逻辑
       dispatch_async(dispatch_get_global_queue(0, 0), ^{
           if (self.imageModelArray.count > 0) {
               imgGroup *image = self.imageModelArray[currentRow];
               NSLog(@"测试选中图片的值：%ld",(long)image.isDefault.integerValue);
               webServiceManager *manager = [webServiceManager new];
               [manager setComparePictureWithAppId:@"" andFaceId:image.faceId andUserID:self.userName];
            
           }
       });
       
     
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:self.selectedPath];
        
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        oldCell.textLabel.text = nil;
        self.selectedPath = [indexPath copy];
        
//        imgGroup *image = self.imageModelArray[self.selectedPath.row];
//        
//        webServiceManager *manager = [webServiceManager new];
//    [manager setComparePictureWithAppId:@"" andFaceId:image.faceId andUserID:self.userName];
        
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
       cell.accessoryType = UITableViewCellAccessoryNone;

        
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return (self.view.frame.size.height-44-60)/5;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
