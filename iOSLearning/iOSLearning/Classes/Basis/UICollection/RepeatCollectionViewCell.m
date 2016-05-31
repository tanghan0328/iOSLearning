//
//  RepeatCollectionViewCell.m
//  iOSLearning
//
//  Created by tang on 16/4/1.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "RepeatCollectionViewCell.h"

@implementation RepeatCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 100)];
        _imageView.image = [UIImage imageNamed:@"Image_head@2x"];
        [self addSubview:_imageView];
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 120, 20)];
        [self addSubview:_label];
    }
    return self;
}

- (void)setImageAndLabel:(int)number
{
    _label.text = [NSString stringWithFormat:@"顺序 %d", number];
}
@end
