//
//  TWAdjacentCollectionViewCell.m
//  iOSLearning
//
//  Created by tang tang on 2023/9/6.
//  Copyright © 2023 tang. All rights reserved.
//

#import "TWAdjacentCollectionViewCell.h"

@interface TWAdjacentCollectionViewCell()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation TWAdjacentCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"f8f8f8"];
        self.contentView.layer.masksToBounds = YES;
        self.contentView.layer.cornerRadius = 4;
        
        self.textLabel = UILabel.new;
        self.textLabel.textColor = [UIColor colorWithHexString:@"333333"];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.font = DEFAULT_FONT(12.0);
        [self.contentView addSubview:self.textLabel];
        
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.mas_equalTo(8);
            make.right.mas_equalTo(-8);
        }];
    }
    return self;
}
- (void)setText:(NSString *)text
{
    _text = text;
    self.textLabel.text = text;
}

@end
