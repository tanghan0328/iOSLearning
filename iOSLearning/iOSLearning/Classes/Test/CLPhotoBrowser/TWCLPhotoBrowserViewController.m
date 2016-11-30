//
//  TWCLPhotoBrowserViewController.m
//  iOSLearning
//
//  Created by tang on 16/11/30.
//  Copyright © 2016年 tang. All rights reserved.
//
#import "CLPhotoBrowser.h"
#import "TWCLPhotoBrowserViewController.h"
#import <UIImageView+WebCache.h>


@interface TWCLPhotoBrowserViewController ()<BrowerCellDelegate>
{
    NSArray *_urls;
}
@property (nonatomic, strong) NSMutableArray  *images;
@end

@implementation TWCLPhotoBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _urls = @[@"http://ww4.sinaimg.cn/thumbnail/7f8c1087gw1e9g06pc68ug20ag05y4qq.gif",
              @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr0nly5j20pf0gygo6.jpg",
              @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr1d0vyj20pf0gytcj.jpg",
              @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr1xydcj20gy0o9q6s.jpg",
              @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
              @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr39ht9j20gy0o6q74.jpg",
              @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr3xvtlj20gy0obadv.jpg",
              @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr4nndfj20gy0o9q6i.jpg",
              @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr57tn9j20gy0obn0f.jpg"];
    
    self.images = [NSMutableArray array];
    NSUInteger col = 3;
    CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat margin = 4;
    CGFloat w = (ScreenWidth - 20 - margin*(col - 1))/col ;
    for (int i=0; i<_urls.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10+i%col*(w+margin),100 + i/col*(w+margin), w, w)];
        [self.view addSubview:imageView];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        imageView.tag = i;
        imageView.userInteractionEnabled = YES;
        [self.images addObject:imageView];
        //加载小图图片
        [imageView sd_setImageWithURL:[NSURL URLWithString:_urls[i]] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [imageView addGestureRecognizer:tap];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    CLPhotoBrowser *brower = [[CLPhotoBrowser alloc] init];
    brower.photos = [NSMutableArray array];
    int i=0;
    for (UIImageView *imageView in self.images) {
        CLPhoto *photo = [[CLPhoto alloc] init];
        NSString *url = [_urls[i] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        photo.url = url;
        photo.thumbUrl = _urls[i];
        photo.scrRect = [imageView convertRect:imageView.bounds toView:nil];
        
        [brower.photos addObject:photo];
        i++;
        
    }
    brower.selectImageIndex = tap.view.tag;
    [brower show];
    brower.delegate = self;
}

- (void)collectionViewCell:(PhotoBrowserCell *)cell cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UILabel *label = [cell.contentView viewWithTag:99];
    if (!label) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 30)];
        [cell.contentView addSubview:label];
        label.tag = 99;
        label.textColor = [UIColor redColor];
        [cell.contentView bringSubviewToFront:label];
    }
    label.text = @"fjaowefjaowejfoawef";
}

@end

