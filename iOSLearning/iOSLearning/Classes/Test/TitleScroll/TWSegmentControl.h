//
//  TWSegmentControl.h
//  iOSLearning
//
//  Created by tang on 17/1/9.
//  Copyright © 2017年 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TWSegmentControlType)
{
    TWSegmentControlTypeCenterScroll,
    TWSegmentControlTypeEndScroll,
};

@class TWSegmentControl;

@protocol LXSegmentControlDelegate<NSObject>

-(void)LXSegmentControl:(TWSegmentControl *)segmentControl didSelectBtnAtIndex:(NSInteger)index;

@end;

@interface TWSegmentControl : UIScrollView

//对象方法创建 LXSegmentControl
-(instancetype)initWithFrame:(CGRect)frame delegate:(id <LXSegmentControlDelegate>)delegate titleArr:(NSArray *)titleArr;
//类方法创建 LXSegmentControl
+(instancetype)segmentControlWithFrame:(CGRect)frame delegate:(id <LXSegmentControlDelegate>)delegate titleArr:(NSArray *)titleArr;

@property(nonatomic, weak)id <LXSegmentControlDelegate> SeDelegate;

@property(nonatomic, assign)TWSegmentControlType scrollType;

///** 滚动Conrolller的时候 SegmentControl需要做的处理 */
- (void)titleBtnSelectedWithScrollView:(UIScrollView *)scrollView;

@end
