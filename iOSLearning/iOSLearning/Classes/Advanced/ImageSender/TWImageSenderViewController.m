//
//  TWImageSenderViewController.m
//  iOSLearning
//
//  Created by tang on 16/8/23.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWImageSenderViewController.h"
#import "AFNetworking.h"


@interface TWImageSenderViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong)UIImageView *headerView;
@property (nonatomic, strong)UIImagePickerController *imagePicker;

@end

@implementation TWImageSenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imagePicker = [[UIImagePickerController alloc]init];
    _imagePicker.delegate = self;
    _imagePicker.allowsEditing = YES;
    _imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;


    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, SCREEN_HEIGHT/2, SCREEN_WIDTH - 100, 50)];
    btn.backgroundColor  = [UIColor greenColor];
    [btn setTitle:@"点击上传图片" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(onTapSecondCell) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _headerView = [[UIImageView alloc]initWithFrame:CGRectMake(50, SCREEN_HEIGHT/ 2+ 100, 100, 100)];
    [self.view addSubview:_headerView];
}

- (BOOL) shouldAutorotate
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    [self viewWillAppear:animated];
//}

//点击事件
- (void)onTapSecondCell
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    __weak typeof(self) weakSelf = self;
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self tapTakePhotoBtn];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self tapSeletPhotoBtn];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:^{
            NSLog(@"取消准备照片");
        }];
    }];
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [self presentViewController:alert animated:YES completion:nil];
}

//选择一张图片
-(void)tapSeletPhotoBtn{
    
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:self.imagePicker animated:YES completion:^{
        NSLog(@"到了这里完成了===》");

    }];
}
//拍一下照片
-(void)tapTakePhotoBtn{
    
    if (![UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera]) {
        
        // [self showHint:@"相机不可用"];
        return;
        
    }else{
        //设置UIImagePickerController的SourceType为Camera
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }
    
}
#pragma - mark imagePickerController回调
//imagePickerController点击Finish时的回调
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSLog(@"info = %@",info);
    
        self.headerView.image=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
//imagePickerController点击Cancel时的回调
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)onBackButtonClicked
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self tapSeletPhotoBtn];
}

//- (void)postData
//{
//    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
//    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
//    __weak typeof(self) weakSelf = self;
////    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
//    [manage POST:Health_GetReportPic parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        //上传图片
//        NSData *data = UIImageJPEGRepresentation(_headerView.image, 1.0);
//        [formData appendPartWithFileData:data name:@"report_pic_path" fileName:@"image.png" mimeType:@"png"];
//        //name-->对应数据库存储的字段
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        if ([dict[@"message"] isEqualToString:@"数据插入成功"])
//        {
//            [MBProgressHUD hideHUDForView:self.tableView animated:YES];
//            [weakSelf addAlertControllerWithMessage:@"上传成功"];
//            //沙盒中图片的完整路径
//            NSString *string1 = [NSHomeDirectory() stringByAppendingString:@"/Documents/image.jpg"];
//            NSFileManager *fileManage = [NSFileManager defaultManager];
//            [fileManage removeItemAtPath:string1 error:nil];
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error.localizedDescription);
//        [MBProgressHUD hideHUDForView:self.tableView animated:YES];
//        [weakSelf addAlertControllerWithMessage:@"上传失败"];
//    }];
//}

@end
