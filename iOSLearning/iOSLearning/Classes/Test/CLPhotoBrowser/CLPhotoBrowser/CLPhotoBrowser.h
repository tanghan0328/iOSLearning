//
//  CLPhotoBrowser.h
//  李码哥Demo
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 ufutx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLPhoto.h"
#import "PhotoBrowserCell.h"


@protocol BrowerCellDelegate <NSObject>
@optional
- (void)collectionViewCell:(PhotoBrowserCell *)cell cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface CLPhotoBrowser : UIViewController
@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic ,assign) NSUInteger selectImageIndex;


@property (nonatomic ,assign) id<BrowerCellDelegate> delegate;
- (void)show;
@end
