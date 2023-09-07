//
//  BaseViewController.h
//  iOSLearning
//
//  Created by tang on 16/3/16.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <YYText/YYText.h>

@interface BaseViewController : UIViewController

- (instancetype)initWithTitle:(NSString *)title;

/**
 内容容器view，主要承载navigationbar之下，bottomImageView之上的内容
 */
@property (nonatomic, strong) UIView *contentContainer;
@property (nonatomic, strong) MASConstraint *contentContainerTopConstraint;

/**
 返回按钮
 */
@property (nonatomic, strong) UIButton *backBtn;

// 右边logo
@property (strong, nonatomic, readonly) UIButton *logoBtn;
/**
 navigationBar容器
 */
@property (nonatomic, strong) UIImageView *navContainer;
@property (nonatomic, strong, readonly) YYLabel *navTitleLab;

/**
 设置navigationBar title

 @param title NSString
 */
- (void)setCustomTitle:(NSString *)title;
- (void)setAttrTitle:(NSAttributedString *)attrTitle;
- (NSString *)customTitle;

/**
 子类重写返回事件
 */
- (void)backBtnClick;

/**
 隐藏navigationBar
 */
- (void)hideNav;

/**
 隐藏返回按钮
 */
- (void)hideBackBtn;

/**
 显示返回按钮
 */
- (void)showBackBtn;

/**
 *  导航栏右侧增加按钮(从右排列)(默认设置俩btn位置，btn属性需要自己处理)
 *    宽高：38，距屏幕右侧边缘：5
 *  @param btn UIButton
 */
- (void)addRightNavBtn1:(UIButton *)btn;
/**
 *  导航栏右侧增加按钮(从右排列)(默认设置俩btn位置，btn属性需要自己处理)
 *    宽高：38，距屏幕右侧边缘：5 + 38
 *  @param btn UIButton
 */
- (void)addRightNavBtn2:(UIButton *)btn;
/**
 *  从右向左添加右侧button,会根据已添加的数量调整按钮位置
 *    使用了addRightNavBtn1、addRightNavBtn2后可以使用addRightNavigationButton在已添加的基础上继续添加
 *    但是不能使用了addRightNavigationButton后再使用addRightNavBtn1
 *  @param btn UIButton
 */
- (void)addRightNavigationButton:(UIButton *)btn;
/**
 *  指定右侧按钮的位置
 *  @param btn UIButton
 *  @param aIndex NSInteger 插入位置
 */
- (void)insertRightNavigationButton:(UIButton *)btn atIndex:(NSInteger)aIndex;
/**
 *  更新右边按钮的布局
 */
- (void)updateRightNavigationButtons;

/**
 *  要添加的下一个Button应该距屏幕右侧的偏移量
 */
- (CGFloat)nextRightButtonOffset;

@end
