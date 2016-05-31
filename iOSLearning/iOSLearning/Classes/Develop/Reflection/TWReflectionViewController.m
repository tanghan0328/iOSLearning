//
//  TWReflectionViewController.m
//  iOSLearning
//
//  Created by tang on 16/5/30.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWReflectionViewController.h"
#import "TWImageView.h"

@interface TWReflectionViewController ()
@property (strong, nonatomic) IBOutlet TWImageView *layer;

@end

@implementation TWReflectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    CAReplicatorLayer *imageLayer = (CAReplicatorLayer *)_layer.layer;
    imageLayer.instanceCount = 2;
    
    CATransform3D transform = CATransform3DMakeTranslation(0, _layer.bounds.size.height, 0);
    transform = CATransform3DRotate(transform, M_PI, 1, 0, 0);
    //向下面平移控件的高度
    imageLayer.instanceTransform = transform;
    
    imageLayer.instanceRedOffset = -0.1;
    imageLayer.instanceBlueOffset = -0.1;
    imageLayer.instanceGreenOffset = -0.1;
    imageLayer.instanceAlphaOffset = -0.1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
