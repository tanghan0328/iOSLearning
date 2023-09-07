//
//  TWAdjacentCollectionLayout.m
//  iOSLearning
//
//  Created by tang tang on 2023/9/6.
//  Copyright © 2023 tang. All rights reserved.
//

#import "TWAdjacentCollectionLayout.h"

@implementation TWAdjacentCollectionLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray<UICollectionViewLayoutAttributes *> *attributes = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray<UICollectionViewLayoutAttributes *> *allAttributes = [NSMutableArray arrayWithArray:attributes];
    CGFloat padding_H = self.minimumLineSpacing;//item 行距
    CGFloat padding_V = self.minimumInteritemSpacing;//item 列距
    UIEdgeInsets sectionInset = self.sectionInset;
    CGFloat margin_H = sectionInset.left;//左边距 右边距
    CGFloat section_padding_H = sectionInset.left + sectionInset.right;

    CGFloat thisX = margin_H;
    NSInteger rowCount = 0;
    NSIndexPath *lastIndexPath;
    
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
            padding_H = [self.delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:attribute.indexPath.section];
        }
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
            padding_V = [self.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:attribute.indexPath.section];
        }
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
            sectionInset = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:attribute.indexPath.section];
            margin_H = sectionInset.left;//左边距 右边距
            section_padding_H = sectionInset.left + sectionInset.right;
        }
        if (!lastIndexPath || lastIndexPath.section < attribute.indexPath.section) {
            lastIndexPath = attribute.indexPath;
            thisX = margin_H;
        }
        
        CGRect newLeftAlignedFrame = attribute.frame;
        if (attribute.representedElementKind == nil) {
            if (thisX + attribute.frame.size.width + margin_H <= rect.size.width) {
                //能放则放
            }else{//不能放换行new
                thisX = margin_H;
                if (attribute.frame.size.width > rect.size.width - section_padding_H){
                    newLeftAlignedFrame.size.width = rect.size.width - section_padding_H;
                    if (attribute.indexPath.row != rowCount) {
                        newLeftAlignedFrame.size.width = rect.size.width - section_padding_H;

                    }else if(!attribute.indexPath.row){
                        newLeftAlignedFrame.size.width = rect.size.width - section_padding_H;
                    }else{
                        rowCount = attribute.indexPath.row;
                    }
                }else{
                    rowCount = attribute.indexPath.row;
                }
            }
            newLeftAlignedFrame.origin.x = thisX;
            attribute.frame = newLeftAlignedFrame;

            thisX += attribute.frame.size.width + padding_H;
            [allAttributes addObject:attribute];
        }
    }
    
    return allAttributes;
}

//MARK:-
- (id<UICollectionViewDelegateFlowLayout>)delegate {
    return (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
}

@end
