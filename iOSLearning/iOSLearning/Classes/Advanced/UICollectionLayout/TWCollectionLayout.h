//
//  TWCollectionLayout.h
//  iOSLearning
//
//  Created by tang on 16/11/18.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef CGSize(^SizeBlock)(NSIndexPath *indexPath);

@interface TWCollectionLayout : UICollectionViewLayout

/** 行间距 */
@property (nonatomic, assign) CGFloat rowSpacing;
/** 列间距 */
@property (nonatomic, assign) CGFloat lineSpacing;
/** 内边距 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;

/*
 *  获取item宽高
 *
 *  @param block 返回宽高的block
 */
- (void)calculateItemSizeWithWidthBlock:(CGSize (^)(NSIndexPath *indexPath))block;
@end
