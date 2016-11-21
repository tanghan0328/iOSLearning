//
//  TWCircleCollectionViewCell.m
//  iOSLearning
//
//  Created by tang on 16/11/21.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWCircleCollectionViewCell.h"

@interface  TWCircleCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TWCircleCollectionViewCell

- (void)awakeFromNib {;
    [super awakeFromNib];
    self.backgroundColor = [UIColor orangeColor];
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 10;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
