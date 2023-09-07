//
//  BaseViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/16.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "BaseViewController.h"
#import <objc/runtime.h>

static CGFloat const kTYCBaseViewControllerRightButtonWidth = 38.;

@interface BaseViewController ()

/**
 navigationBar title
 */
@property (nonatomic, strong) YYLabel *navTitleLab;
/**
 navContainer底部的线，可以控制隐藏与消失
 */
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) NSMutableArray<UIView *> *rightNavViews;


@end

@implementation BaseViewController
{
    /**
    * 隐藏navigationBar
    *
    * 需要在初始化之后 viewDidLoad 之前设置
    */
    BOOL  _tyc_hideNavigationBar;
}

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if(self){
        self.customTitle = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    [self testCLanguage];
    [self setUpTYCBaseUI];
    if (_tyc_hideNavigationBar) {
        [self hideNav];
    }
}

- (void)setUpTYCBaseUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNav];
    
    UIView *contentContainer = [UIView new];
    [self.view addSubview:contentContainer];
    self.contentContainer = contentContainer;
}

- (void)hideNav{
    if (!self.isViewLoaded) {
        _tyc_hideNavigationBar = YES;
        return;
    }
    self.navContainer.hidden = YES;
    [self updateContentContainer];
}

- (void)updateContentContainer {
    [self.contentContainer mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (self.navContainer.hidden) {
            self.contentContainerTopConstraint =
            make.top.equalTo(self.view);
        }else {
            self.contentContainerTopConstraint =
            make.top.equalTo(self.navContainer.mas_bottom);
        }
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.view);
    }];
    [self.view layoutIfNeeded];
}

//获取类的C语言方法。
- (void)testCLanguage
{
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    //获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Method method = methodList[i];
        NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    //获取成员变量列表
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    //获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
}

- (void)hiddenBottomLine:(BOOL)hide{
    self.bottomLine.hidden = hide;
}

- (void)setCustomTitle:(NSString *)title{
    self.navTitleLab.text = title;
    [self.view bringSubviewToFront:self.navContainer];
}

- (void)setAttrTitle:(NSAttributedString *)attrTitle {
    self.navTitleLab.attributedText = attrTitle;
}

- (NSString *)customTitle {
    return self.navTitleLab.text;
}

- (void)hideBackBtn{
    [self hideBackBtnWithAnimate:YES];
}

- (void)showBackBtn{
    [self showBackBtnWithAnimate:YES];
}

- (void)showBackBtnWithAnimate:(BOOL)animated{
    CGFloat t = animated ?0.1 :0.0;
    self.backBtn.hidden = NO;
    [UIView animateWithDuration:t animations:^{
        self.backBtn.alpha = 1.0;
    }];

}

- (void)hideBackBtnWithAnimate:(BOOL)animated{
    CGFloat t = animated ?0.1 :0.0;
    [UIView animateWithDuration:t animations:^{
        self.backBtn.alpha = 0.0;
    }completion:^(BOOL finished) {
        self.backBtn.hidden = YES;
    }];
}

- (void)setupNav{
    UIImageView *container = [[UIImageView alloc]init];
    container.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    container.userInteractionEnabled = YES;
    
    [self.view addSubview:container];
    self.navContainer = container;
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.height.mas_equalTo(IPHONE_X_NAVIGATION_BAR_H);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(-3);
        make.width.height.mas_equalTo(38);
    }];
    self.backBtn = back;
    
    YYLabel *titleLab = [[YYLabel alloc]init];
    titleLab.font = MEDIUM_FONT(17);
    titleLab.textColor = [UIColor colorWithHexString:@"333333"];
    [container addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(container.mas_centerX);
        make.centerY.equalTo(back.mas_centerY);
        make.left.mas_greaterThanOrEqualTo(45);
        make.right.mas_lessThanOrEqualTo(-45);
    }];
    self.navTitleLab = titleLab;
    
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithHexString:@"e0e0e0"];
    [container addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(SINGLE_LINE_WIDTH);
    }];
    self.bottomLine = line;
}

- (void)backBtnClick{
    if (self.navigationController.viewControllers.count <= 1) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }else {
       [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)addLeftNavBtn1:(UIButton *)btn{
    [self.navContainer addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backBtn.mas_right).with.mas_offset(5);
        make.width.height.mas_equalTo(38);
        make.bottom.mas_equalTo(-3);
    }];
    [self.navTitleLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.greaterThanOrEqualTo(btn.mas_right).with.mas_offset(10);
    }];
}

- (void)removeLeftNavBtn1:(UIButton *)btn{
    [btn removeFromSuperview];
    [self.navTitleLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.greaterThanOrEqualTo(self.backBtn.mas_right).with.mas_offset(10);
    }];
}

- (void)addRightNavBtn1:(UIButton *)btn{
    [self tyc_addRightNavigationButton:btn rightOffset:5 atIndex:0];
}
  
- (void)addRightNavBtn2:(UIButton *)btn{
    CGFloat rightOffset = 5 + kTYCBaseViewControllerRightButtonWidth;
    [self tyc_addRightNavigationButton:btn rightOffset:rightOffset atIndex:1];
}

- (void)tyc_addRightNavigationButton:(UIButton *)btn rightOffset:(CGFloat)offset atIndex:(NSInteger)aIndex{
    
    if(aIndex == NSNotFound) {
        [self.rightNavViews addObject:btn];
    } else {
        if(aIndex > self.rightNavViews.count) return;
        [self.rightNavViews insertObject:btn atIndex:aIndex];
    }
    [self.navContainer addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-offset);
        make.bottom.mas_equalTo(-3);
        make.width.height.mas_equalTo(kTYCBaseViewControllerRightButtonWidth);
    }];
    [self.navTitleLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.lessThanOrEqualTo(btn.mas_left).with.mas_offset(-10);
    }];
}

- (void)addRightNavigationButton:(UIButton *)btn {
    NSArray *validRightViews = [self.rightNavViews mutableCopy];
    CGFloat rightOffset = 5. + kTYCBaseViewControllerRightButtonWidth * validRightViews.count;
    [self tyc_addRightNavigationButton:btn rightOffset:rightOffset atIndex:NSNotFound];
}

- (void)updateRightNavigationButtons {
    __block NSInteger showRightBtnIndex = 0;
    __block UIView *lastView = nil;
    [self.rightNavViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(!obj.isHidden && obj.superview) {
            CGFloat rightOffset =  5 + showRightBtnIndex * kTYCBaseViewControllerRightButtonWidth;
            [obj mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-rightOffset);
            }];
            showRightBtnIndex += 1;
            lastView = obj;
        }
    }];
    if(lastView) {
        [self.navTitleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.lessThanOrEqualTo(lastView.mas_left).with.mas_offset(-10);
        }];
    }
}

- (void)insertRightNavigationButton:(UIButton *)btn atIndex:(NSInteger)aIndex {
    if(aIndex > self.rightNavViews.count) {//越界
        return;
    }
    [self.navContainer addSubview:btn];
    CGFloat rightOffset = 5. + kTYCBaseViewControllerRightButtonWidth * aIndex;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-rightOffset);
        make.bottom.mas_equalTo(-3);
        make.width.height.mas_equalTo(kTYCBaseViewControllerRightButtonWidth);
    }];
    [self.rightNavViews insertObject:btn atIndex:aIndex];
    [self updateRightNavigationButtons];
}

- (CGFloat)nextRightButtonOffset {
    NSArray *validRightViews = self.rightNavViews.mutableCopy;
    return 5. + kTYCBaseViewControllerRightButtonWidth * validRightViews.count;
}

- (void)cleanAllRightView {
    [self.rightNavViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.rightNavViews removeAllObjects];
    [self.navTitleLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_greaterThanOrEqualTo(45);
        make.right.mas_lessThanOrEqualTo(-45);
    }];
}

- (NSMutableArray<UIView *> *)rightNavViews {
    if (!_rightNavViews) {
        _rightNavViews = [NSMutableArray new];
    }
    return _rightNavViews;
}


@end
