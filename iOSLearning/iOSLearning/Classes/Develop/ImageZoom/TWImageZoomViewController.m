//
//  TWImageZoomViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/3.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWImageZoomViewController.h"

@interface TWImageZoomViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIImage *image;

@end

@implementation TWImageZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.bounds = [UIScreen mainScreen].bounds;
    [self _initSubViews];
    self.image = [UIImage imageNamed:@"227.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)_initSubViews{
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate=self;
    scrollView.maximumZoomScale=5.0;//最大缩放倍数
    scrollView.minimumZoomScale=1.0;//最小缩放倍数
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:scrollView];
    self.scrollView=scrollView;
    
    UIImageView *imageView=[[UIImageView alloc] init];
    imageView.userInteractionEnabled=YES;//在UIImageView上加手势识别，打开用户交互
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [imageView addGestureRecognizer:doubleTap];//添加双击手势
    [scrollView addSubview:imageView];
    self.imageView=imageView;
}

- (void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image=image;
    CGFloat width=image.size.width;
    CGFloat height=image.size.height;
    CGFloat maxHeight=self.scrollView.bounds.size.height;
    CGFloat maxWidth=self.scrollView.bounds.size.width;
    NSLog(@"宽%f与高%f",width,height);
    //如果图片尺寸大于view尺寸，按比例缩放
    if(width >= maxWidth||height >= maxHeight){
        CGFloat ratio=height/width;
        CGFloat maxRatio=maxHeight/maxWidth;
        if(ratio<maxRatio){
            width=maxWidth;
            height=width*ratio;
        }else{
            height=maxHeight;
            width=height/ratio;
        }
        NSLog(@"maxHeight宽%f与高%f",maxWidth,maxHeight);
        NSLog(@"height宽%f与高%f",width,height);
        self.imageView.frame=CGRectMake((maxWidth - width)/2, (maxHeight-height)/2, width, height);
    }else{
        NSLog(@"maxWidth宽%f与高%f",maxWidth,maxHeight);
        NSLog(@"width宽%f与高%f",width,height);
        self.imageView.frame=CGRectMake((maxWidth - width)/2, (maxHeight-height)/2, width, height);
    }
    
    NSLog(@"图片的位置===>%@",NSStringFromCGRect(self.imageView.frame));
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)recongnizer
{
    UIGestureRecognizerState state = recongnizer.state;
    switch (state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            //以点击点为中心，放大图片
            CGPoint touchPoint=[recongnizer locationInView:recongnizer.view];
            BOOL zoomOut=self.scrollView.zoomScale==self.scrollView.minimumZoomScale;
            CGFloat scale=zoomOut?self.scrollView.maximumZoomScale:self.scrollView.minimumZoomScale;
            [UIView animateWithDuration:0.3 animations:^{
                self.scrollView.zoomScale=scale;
                if(zoomOut){
                    CGFloat x=touchPoint.x*scale-self.scrollView.bounds.size.width/2;
                    CGFloat maxX=self.scrollView.contentSize.width-self.scrollView.bounds.size.width;
                    CGFloat minX=0;
                    x=x>maxX?maxX:x;
                    x=x<minX?minX:x;
                    
                    CGFloat y=touchPoint.y*scale-self.scrollView.bounds.size.height/2;
                    CGFloat maxY=self.scrollView.contentSize.height-self.scrollView.bounds.size.height;
                    CGFloat minY=0;
                    y=y>maxY?maxY:y;
                    y=y<minY?minY:y;
                    self.scrollView.contentOffset=CGPointMake(x, y);
                }
            }];
            
        }
            break;
        default:break;
    }
}

#pragma mark UIScrollViewDelegate
//指定缩放UIScrolleView时，缩放UIImageView来适配
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

//缩放后让图片显示到屏幕中间
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGSize originalSize=_scrollView.bounds.size;
    CGSize contentSize=_scrollView.contentSize;
    CGFloat offsetX=originalSize.width>contentSize.width?(originalSize.width-contentSize.width)/2:0;
    CGFloat offsetY=originalSize.height>contentSize.height?(originalSize.height-contentSize.height)/2:0;
    
    self.imageView.center=CGPointMake(contentSize.width/2+offsetX, contentSize.height/2+offsetY);
}

@end
