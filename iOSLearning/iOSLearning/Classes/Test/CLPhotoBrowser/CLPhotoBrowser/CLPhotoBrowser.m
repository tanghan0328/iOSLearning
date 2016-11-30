//
//  CLPhotoBrowser.m
//  李码哥Demo
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 ufutx. All rights reserved.
//

#import "CLPhotoBrowser.h"
#import "PhotoBrowserCell.h"
#import <UIImageView+WebCache.h>

#ifndef ScreenWidth
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#endif
#ifndef ScreenHeight
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#endif
#define PhotoBrowerMargin          20.f


@interface CLPhotoBrowser ()<UICollectionViewDataSource,UICollectionViewDelegate,PhotoBrowserCellDelegate,UIActionSheetDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, weak) UIPageControl *pageCtl;

///当前页
@property (nonatomic ,assign) NSUInteger currentSelectIndex;

@end


static NSString *const PhotoBrowserCellIdentifier = @"PhotoBrowserCellIdentifier";
static NSTimeInterval const duration = 0.3;

@implementation CLPhotoBrowser
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)show
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];

    UIViewController *rootViewCtl = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootViewCtl addChildViewController:self];
    [rootViewCtl.view addSubview:self.view];
    [self showFirstImageView];
}

- (void)showFirstImageView
{

    CLPhoto *photo = [self.photos objectAtIndex:self.selectImageIndex];
    self.imageView = [[UIImageView alloc] init];
    [self.view addSubview:self.imageView];
    

    
    BOOL existBigPic = NO;
    self.imageView.image = [CLPhoto existImageWithUrl:photo.url];
    if (self.imageView.image) { //查看大图是否存在
        existBigPic = YES;
    }else{//查看小图是否存在
        self.imageView.image = [CLPhoto existImageWithUrl:photo.thumbUrl];
        if (self.imageView.image == nil) { //大小图都不存在时
            self.imageView.image = [UIImage imageNamed:@"dialog_load"];
        }
    }
    
    
    //渐变显示
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    self.imageView.frame = photo.scrRect;
    __weak typeof(self)weakself = self;
    CGPoint ScreenCenter = self.view.window.center;

    [UIView animateWithDuration:duration animations:^{
        //有大图直接显示大图，没有先显示小图
        if (existBigPic) {
            CGSize size = [CLPhoto displaySize:self.imageView.image];
            weakself.imageView.frame = CGRectMake(0, 0, size.width, size.height);
            
            //长图处理
            if (size.height<=[UIScreen mainScreen].bounds.size.height) {
                weakself.imageView.center = ScreenCenter;
            }

        }else{
            self.imageView.center = self.view.center;
        }
        weakself.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1.0];

        
    } completion:^(BOOL finished) {
        [weakself.imageView removeFromSuperview];

        weakself.imageView = nil;
        weakself.collectionView.contentOffset = CGPointMake(self.selectImageIndex*[UIScreen mainScreen].bounds.size.width, 0);
        weakself.pageCtl.numberOfPages = self.photos.count;
        weakself.pageCtl.currentPage = self.selectImageIndex;
        weakself.currentSelectIndex = self.selectImageIndex;
        [_collectionView setContentOffset:(CGPoint){weakself.currentSelectIndex * (self.view.bounds.size.width + 20),0} animated:NO];

    }];
}




#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoBrowserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoBrowserCellIdentifier forIndexPath:indexPath];
    CLPhoto *photo = [self.photos objectAtIndex:indexPath.item];
    cell.photo = photo;
    cell.delegate = self;
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectionViewCell:cellForItemAtIndexPath:)]) {
        [self.delegate collectionViewCell:cell cellForItemAtIndexPath:indexPath];
    }

    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.currentSelectIndex = round(scrollView.contentOffset.x / (ScreenWidth + 20));

    self.pageCtl.currentPage = self.currentSelectIndex;
}

#pragma mark - PhotoBrowserCellDelegate
- (void)didSelectedPhotoBrowserCell:(PhotoBrowserCell *)cell
{
    
    if (cell.imageView.frame.size.height > [UIScreen mainScreen].bounds.size.height || cell.imageView.frame.size.width > [UIScreen mainScreen].bounds.size.width) {
        self.imageView = [[UIImageView alloc] init];
        // 开启图形上下文
        UIGraphicsBeginImageContextWithOptions([UIScreen mainScreen].bounds.size, YES, 0.0);
        
        // 将下载完的image对象绘制到图形上下文
        CGFloat width = cell.imageView.frame.size.width;
        CGFloat height = width *  cell.imageView.image.size.height /  cell.imageView.image.size.width;
        [cell.imageView.image drawInRect:CGRectMake(0, 0,  cell.imageView.image.size.width, height)];
        
        // 获得图片
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        CGRect frame = cell.imageView.frame;
        frame.size.height = [UIScreen mainScreen].bounds.size.height;
        self.imageView.frame = frame;
        
        // 结束图形上下文
        UIGraphicsEndImageContext();
        [self.view addSubview:self.imageView];
        [self.collectionView removeFromSuperview];
        
        [self hide:self.imageView with:cell.photo];

    }else{
        
        [self hide:cell.imageView with:cell.photo];
    }

    
}
- (void)hide:(UIImageView *)imageView with:(CLPhoto *)photo
{

    
    CGFloat width  = imageView.image.size.width;
    CGFloat height = imageView.image.size.height;
    
    CGSize tempRectSize = (CGSize){ScreenWidth,(height * ScreenWidth / width) > ScreenHeight ? ScreenHeight:(height * ScreenWidth / width)};
    
    [imageView setBounds:(CGRect){CGPointZero,{tempRectSize.width,tempRectSize.height}}];
    [imageView setCenter:self.view.center];
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [imageView setFrame:photo.scrRect];
        self.view.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}

#pragma mark - 保存图片
- (void)longPressPhotoBrowserCell:(PhotoBrowserCell *)cell
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"保存图片", nil];
    [sheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            CLPhoto *photo = self.photos[self.currentSelectIndex];
            UIImageWriteToSavedPhotosAlbum(photo.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        });
    }
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.90f];
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    label.bounds = CGRectMake(0, 0, 150, 40);
    label.center = self.view.center;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:17];
    [[UIApplication sharedApplication].keyWindow addSubview:label];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:label];
    if (error) {
        label.text = @"保存失败";
    }   else {
        label.text = @"保存成功";
    }
    [label performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1.0];
    
}

#pragma mark - lazy
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        
        CGRect bounds = [UIScreen mainScreen].bounds;
        bounds.size.width += PhotoBrowerMargin;
        
        // 1.create layout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setItemSize:bounds.size];
        [layout setMinimumInteritemSpacing:0];
        [layout setMinimumLineSpacing:0];
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:bounds collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView setPagingEnabled:YES];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoBrowserCell class]) bundle:nil] forCellWithReuseIdentifier:PhotoBrowserCellIdentifier];
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
    }
    return _collectionView;
}
- (UIPageControl *)pageCtl
{
    if (_pageCtl == nil) {
        UIPageControl *pageCtl = [[UIPageControl alloc] init];
        pageCtl.userInteractionEnabled = NO;
        pageCtl.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49);
        [self.view addSubview:pageCtl];
        
        _pageCtl = pageCtl;
    }
    return _pageCtl;
}
@end
