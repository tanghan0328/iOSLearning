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

@end

@implementation TWImageSenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, SCREEN_HEIGHT/2, SCREEN_WIDTH - 100, 50)];
    btn.backgroundColor  = [UIColor greenColor];
    [btn setTitle:@"点击上传图片" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(onTapSecondCell) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _headerView = [[UIImageView alloc]initWithFrame:CGRectMake(50, SCREEN_HEIGHT/ 2+ 100, 100, 100)];
    [self.view addSubview:_headerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//点击事件
- (void)onTapSecondCell
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof(self) weakSelf = self;
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf takePhoto];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf localPhoto];
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

//打开相机
- (void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])//相机
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        
        [self presentViewController:picker animated:YES completion:^{
            NSLog(@"调取相机成功");
        }];
    }
    else{
        NSLog(@"模拟器情况下无法打开");
    }
}
//打开相册
- (void)localPhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])//相册
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^{
            NSLog(@"调取相册成功");
        }];
    }
    else{
        NSLog(@"相册打不开应该是出问题了");
    }
}

#pragma mark -- delegate代理方法

//当选择一张图片后进入到这个协议方法里
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        NSData *data1;
        if (UIImagePNGRepresentation(image) == nil)
        {
            data1 = UIImageJPEGRepresentation(image, 1);
        }
        else
        {
            data1 = UIImagePNGRepresentation(image);
        }
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data1 attributes:nil];
        //得到选择后沙盒中图片的完整路径
        NSString *filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        long long abc = [self fileSizeAtPath:filePath];
        if (abc < 1024000) {
            _headerView.image = image;
        }
        else {
            //如果图片尺寸过大则压缩
            UIImage *small = [NSString compressOriginalImage:image toSize:CGSizeMake(image.size.width/4, image.size.height/4)];
            NSData *data;
            if (UIImagePNGRepresentation(small) == nil)
            {
                data = UIImageJPEGRepresentation(small, 0.25);
            }
            else
            {
                data = UIImagePNGRepresentation(small);
            }
            [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
            _headerView.image = small;
        }
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:^{
            NSLog(@"关闭相册界面");
        }];
//        [self.tableView reloadData];
    }
}
//判断文件的大小
- (long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"您取消了选择图片222");
    }];
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
