//
//  TWAdjacentCollectionViewController.m
//  iOSLearning
//
//  Created by tang tang on 2023/9/6.
//  Copyright © 2023 tang. All rights reserved.
//

#import "TWAdjacentCollectionViewController.h"
#import "TWAdjacentCollectionViewCell.h"
#import "TWAdjacentCollectionLayout.h"

@interface TWAdjacentCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *datasourceArray;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation TWAdjacentCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datasourceArray = @[@"开采辅助活动",@"其他采矿业",@"黑色金属矿采选业",@"有色金属矿采选业",@"非金属矿采选业",@"制造业",@"计算机、通信和其他电子设备制造业",
                             @"铁路、船舶",@"电气机械和器材制造业",@"废弃资源综合利用业",@"其他制造业",@"仪器仪表制造业"];
    [self initCollectionView];
    [self.collectionView layoutIfNeeded];
    NSLog(@"self.collectionView===>%@",NSStringFromCGRect(self.collectionView.frame));
    [self.collectionView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"self.collectionView===>%@",NSStringFromCGRect(self.collectionView.frame));
    [self.collectionView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 29;
    CGFloat width = 0;
    UIEdgeInsets sectionInset = collectionViewLayout.sectionInset;
    CGFloat section_padding_H = sectionInset.left + sectionInset.right;
    if ([self respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        sectionInset = [self collectionView:self.collectionView layout:collectionViewLayout insetForSectionAtIndex:indexPath.section];
        section_padding_H = sectionInset.left + sectionInset.right;
    }
    NSString *textStr = self.datasourceArray[indexPath.row];
    CGFloat titleWidth = ceil([textStr boundsRectWithSize:CGSizeMake(SCREEN_WIDTH - section_padding_H, height) andFont:[UIFont systemFontOfSize:12]].width);
    width = MAX(titleWidth + 16, 53);
    return CGSizeMake(width, height);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 5, 10);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datasourceArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TWAdjacentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TWAdjacentCollectionViewCell" forIndexPath:indexPath];
    NSString *textStr = self.datasourceArray[indexPath.row];
    cell.text = textStr;
    return cell;
}

- (void)initCollectionView {
    TWAdjacentCollectionLayout *layout = [TWAdjacentCollectionLayout new];
    layout.minimumLineSpacing = 8.0f;
    layout.minimumInteritemSpacing = 8.0f;
    layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, IPHONE_X_NAVIGATION_BAR_H, SCREEN_WIDTH, SCREEN_HEIGHT-IPHONE_X_NAVIGATION_BAR_H) collectionViewLayout:layout];
    self.collectionView.backgroundColor = UIColor.clearColor;
    [self.collectionView registerClass:TWAdjacentCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(TWAdjacentCollectionViewCell.class)];
    [self.collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:UICollectionElementKindSectionHeader];
    [self.collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:UICollectionElementKindSectionFooter];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.contentContainer addSubview:self.collectionView];
}

@end
