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
    self.title = @"二维码扫描";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self startScan];
//    NSTimer *splashTimer = nil;
//    splashTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(anmimationView) userInfo:nil repeats:YES];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self anmimationView];
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
    [_session addOutput:output];
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    // 4.添加一个显示的layer
    AVCaptureVideoPreviewLayer *layer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
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
        [UIView setAnimationRepeatCount:9999.5f];
        _bottomConstraint.constant = 300;
        [self.view layoutIfNeeded];

    } completion:^(BOOL finished) {
        _bottomConstraint.constant = 0;
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
        
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"再次扫描" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self startScan];
        }];
        
        [alertView addAction:cancleAction];
        [alertView addAction:sureAction];
        
        [self presentViewController:alertView animated:YES completion:nil];
    }
}

@end
