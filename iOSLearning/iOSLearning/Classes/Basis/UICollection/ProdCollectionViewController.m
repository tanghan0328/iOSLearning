//
//  ProdCollectionViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/1.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "ProdCollectionViewController.h"

#define identifier @"collectioncell"

@interface ProdCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *collection;

@end

@implementation ProdCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithCollection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.collection setContentOffset:CGPointMake(0, 300) animated:NO];
}

- (void)initWithCollection
{
    //初始化布局类(UICollectionViewLayout的子类)
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
    //初始化collectionView
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:fl];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    [self.collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    _collection.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    //防止cell复用  图片与文字重复
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Image_head@2x"]];
    imageView.frame = CGRectMake(0, 0, 100, 100);
    [cell.contentView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 100, 20)];
    label.text = [NSString stringWithFormat:@"内容为%d",indexPath.row];
    [cell.contentView addSubview:label];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 120);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 15, 5, 15);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//动画查看
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row % 2 != 0) {
        cell.transform = CGAffineTransformTranslate(cell.transform, SCREEN_WIDTH/2, 0);
    }else{
        cell.transform = CGAffineTransformTranslate(cell.transform, -SCREEN_WIDTH/2, 0);
    }
    cell.alpha = 0.0;
    [UIView animateWithDuration:0.7 animations:^{
        cell.transform = CGAffineTransformIdentity;
        cell.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
}

@end
