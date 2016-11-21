//
//  RepeatCellViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/1.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "RepeatCellViewController.h"
#import "RepeatCollectionViewCell.h"

#define identifier @"cell"

@interface RepeatCellViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collection;

@end

@implementation RepeatCellViewController

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
    [self.collection registerClass:[RepeatCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    _collection.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collection];
    
//    复用的解决方案
//    for (UIView *subView in cell.contentView.subviews) {
//        [subView removeFromSuperview];
//    }
//    在UITableView中遇到过，原因是Cell的重用机制以及在自定义的Cell中将新建控件和为控件赋值写在了一起，然后不断的addSubview，最终导致Cell中的内容重叠。解决方法有两个。
//    1、在自定义的Cell中把UI部分和为UI控件赋值的部分分开写。在TableView中为Cell某些控件赋值的时候调用Cell中赋值的方法，这样就不会重复的addsubview，也就不会出现Cell重合的问题了。
//    2、如果一定要把赋值和创建UI控件写在一起，那么添加的时候添加到cell的contentView上。在tableView中，当取到一个重用Cell的时候就将cell中的值清空一下，也就是5楼的那段代码。
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
    RepeatCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    [cell setImageAndLabel:indexPath.row];
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

@end

