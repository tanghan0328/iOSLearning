//
//  TWSCanViewController.m
//  iOSLearning
//
//  Created by tang on 16/11/23.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWSCanViewController.h"

@interface TWSCanViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *borderView;
@property (weak, nonatomic) IBOutlet UIImageView *scaneLineView;

@property (nonatomic, strong)AVCaptureSession *session;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet UIView *scanBackView;

@end

@implementation TWSCanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的关注";
    
//    //选择自己喜欢的颜色
//    UIColor * color = [UIColor whiteColor];
//    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
//    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
//    //大功告成
//    self.navigationController.navigationBar.titleTextAttributes = dict;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //设置成透明色的navigation
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    //给navigationBar设置一个空的背景图片即可实现透明，而且标题按钮都在
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    UIColor * color = [UIColor whiteColor];
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    //大功告成
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    [self startScan];
//    NSTimer *splashTimer = nil;
//    splashTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(anmimationView) userInfo:nil repeats:YES];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self anmimationView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = nil;
    UIColor * color = [UIColor blackColor];
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    //大功告成
    self.navigationController.navigationBar.titleTextAttributes = dict;
}


- (void)startScan
{
    // 1.创建捕捉会话
    _session = [[AVCaptureSession alloc] init];
    
    // 2.设置输入设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *inputDevice = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    [_session addInput:inputDevice];
    
    // 3.设置输入方式
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];

    
    
    
    CGSize size = self.view.bounds.size;
    CGRect cropRect = CGRectMake((SCREEN_HEIGHT-300)/2, (SCREEN_HEIGHT -300)/2, 300, 300);
    CGFloat p1 = size.height/size.width;
    CGFloat p2 = 1920./1080.;  //使用了1080p的图像输出
    if (p1 < p2) {
        CGFloat fixHeight = size.width * 1920. / 1080.;
        CGFloat fixPadding = (fixHeight - size.height)/2;
        output.rectOfInterest = CGRectMake((cropRect.origin.y + fixPadding)/fixHeight,
                                                  cropRect.origin.x/size.width,
                                                  cropRect.size.height/fixHeight,
                                                  cropRect.size.width/size.width);
    } else {
        CGFloat fixWidth = size.height * 1080. / 1920.;
        CGFloat fixPadding = (fixWidth - size.width)/2;
        output.rectOfInterest = CGRectMake(cropRect.origin.y/size.height,
                                                  (cropRect.origin.x + fixPadding)/fixWidth,
                                                  cropRect.size.height/size.height,
                                                  cropRect.size.width/fixWidth);
    }
    
    
    NSLog(@"测试的frame大小=》%@",NSStringFromCGRect(CGRectMake(_borderView.bounds.origin.x/SCREEN_HEIGHT, _borderView.bounds.origin.y/SCREEN_WIDTH, _borderView.bounds.size.width/SCREEN_HEIGHT, _borderView.bounds.size.height/SCREEN_WIDTH)));
    [_session addOutput:output];
//    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeEAN13Code,
                                     AVMetadataObjectTypeEAN8Code,
                                     AVMetadataObjectTypeCode128Code,
                                     AVMetadataObjectTypeQRCode]];
    
    // 4.添加一个显示的layer
    AVCaptureVideoPreviewLayer *layer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame = self.view.bounds;
    NSLog(@"测试的页面大小=====》%@",NSStringFromCGRect(self.view.bounds));
    [self.view.layer insertSublayer:layer atIndex:0];
    
    // 5.开始扫描
    [_session startRunning];
    

}


- (void)anmimationView
{
//    _bottomConstraint.constant = 300;
//    [self.view layoutIfNeeded];
//    [UIView animateWithDuration:1.0f animations:^{
//        UIView.animationRepeatCount  = 9999;
//        _bottomConstraint.constant =0;
//        [self.view layoutIfNeeded];
//    }];
    
    [UIView animateWithDuration:1.0f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//        [UIView setAnimationRepeatCount:9999.5f];
        [UIView setAnimationRepeatCount:MAXFLOAT];
        _bottomConstraint.constant = 0;
        [self.view layoutIfNeeded];

    } completion:^(BOOL finished) {
        _bottomConstraint.constant = 200;
        [self.view layoutIfNeeded];

    }];
    
    
    
//    _bottomConstraint.constant = 300;
//    [self.view layoutIfNeeded];
//    [UIView animateWithDuration:1.0f animations:^{
//        _bottomConstraint.constant = 0;
//        [self.view layoutIfNeeded];
//        [UIView setAnimationRepeatCount:9999];
//        [UIView setAnimationRepeatAutoreverses:YES];    // default = NO. used if repeat count is non-zero
//
//    }];
}

- (IBAction)turnLiagth:(id)sender
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        if (device.torchMode == AVCaptureTorchModeOff) {
            [device lockForConfiguration:nil];
            [device setTorchMode: AVCaptureTorchModeOn];
            [device unlockForConfiguration];
        }else{
            [device lockForConfiguration:nil];
            [device setTorchMode: AVCaptureTorchModeOff];
            [device unlockForConfiguration];
        }
    }   
} 


#pragma mark - 获取扫描结果
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *object = [metadataObjects lastObject];
        
        NSLog(@"%@", object.stringValue);
    }
    if (metadataObjects.count>0) {
        [_session stopRunning];
        AVMetadataMachineReadableCodeObject *object = [metadataObjects lastObject];
        UIAlertController *alertView =[UIAlertController alertControllerWithTitle:nil message:object.stringValue preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [_session startRunning];
        }];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"再次扫描" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [_session startRunning];
        }];
        
        [alertView addAction:cancleAction];
        [alertView addAction:sureAction];
        
        [self presentViewController:alertView animated:YES completion:nil];
    }
}

@end
