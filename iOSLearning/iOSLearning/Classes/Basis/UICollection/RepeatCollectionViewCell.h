//
//  RepeatCollectionViewCell.h
//  iOSLearning
//
//  Created by tang on 16/4/1.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepeatCollectionViewCell : UICollectionViewCell

@property (nonatomic,retain)UILabel *label;
@property (nonatomic,retain)UIImageView *imageView;

- (void)setImageAndLabel:(int)number;
@end
