//
//  TWPickerViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/20.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWPickerViewController.h"
#import "TWProvince.h"

@interface TWPickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *proviceLabel;

@property (strong, nonatomic) NSMutableArray *provinces;

@property (assign, nonatomic) NSInteger provinceIndex;

@property (weak, nonatomic)UIPickerView *pickView;

@property (strong, nonatomic)UIToolbar *toolbar;

@end

@implementation TWPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *fileLoacalPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"fileLoacalPaht:======>%@",fileLoacalPath);
    _proviceLabel.delegate = self;
    [self cityPickViewCreate];
    [self pickViewCreate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSMutableArray *)provinces
{
    if(_provinces == nil){
        _provinces = [NSMutableArray array];
        //加载Plist文件
       // NSDictionary *dic
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"provinces.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
        //将dic变成province数据
        for(NSDictionary *dic in array){
            TWProvince *p = [TWProvince provinceWhithDic:dic];
            [_provinces addObject:p];
        }
    }
    NSLog(@"_provinces的个数%d",_provinces.count);
    return _provinces;
}

- (void)cityPickViewCreate
{
    UIToolbar   *pickerDateToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 194, SCREEN_WIDTH, 44)];
    pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerDateToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    //
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(toolBarCanelClick)];
    [barItems addObject:cancelBtn];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    //
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(toolBarDoneClick)];
    [barItems addObject:doneBtn];
    [pickerDateToolbar setItems:barItems animated:YES];
    pickerDateToolbar.hidden = YES;
    _toolbar = pickerDateToolbar;
    [self.view addSubview:pickerDateToolbar];
}

- (void)pickViewCreate
{
    UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 150, SCREEN_WIDTH, 150)];
    _pickView = pickerView;
    pickerView.delegate = self;
    pickerView.dataSource = self;
    _proviceLabel.inputView = pickerView;
}

- (void)toolBarCanelClick{
    _toolbar.hidden = YES;
    self.pickView.alpha = 0;
    [self.proviceLabel resignFirstResponder];
}

- (void)toolBarDoneClick{
    _toolbar.hidden = YES;
    self.pickView.alpha = 0;
    [self.proviceLabel resignFirstResponder];
    //[self.pickView removeFromSuperview];
}


#pragma mark -- TextViewDelegate
// 是否允许用户输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return NO;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _toolbar.hidden = NO;
    self.pickView.alpha = 1;
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self pickerView:_pickView didSelectRow:0 inComponent:0];
}


#pragma mark -- PickerViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.provinces.count;
    }else{
        TWProvince *p  = self.provinces[_provinceIndex];
        NSLog(@"count=测试的信息与方法=%d",p.cities.count);
        return p.cities.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        TWProvince *p = self.provinces[row];
         NSLog(@"省市名称：%@", p.name);
        return p.name;
       
    }else{
        TWProvince *p = self.provinces[_provinceIndex];
         NSLog(@"城市名称：%@", p.cities[row]);
        return p.cities[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0){
        _provinceIndex = [pickerView selectedRowInComponent:0];
        [pickerView reloadComponent:1];
    }
    TWProvince *p = self.provinces[_provinceIndex];
    NSString *provinceName = p.name;
    NSInteger cityIndex = [pickerView selectedRowInComponent:1];
    NSString *cityName = p.cities[cityIndex];
    _proviceLabel.text = [NSString stringWithFormat:@"%@  %@" ,provinceName,cityName];
}
@end
