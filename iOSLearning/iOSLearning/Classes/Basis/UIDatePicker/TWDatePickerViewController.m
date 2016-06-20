//
//  TWDatePickerViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/20.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWDatePickerViewController.h"

@interface TWDatePickerViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dateTextfiled;
@property (weak, nonatomic) UIDatePicker *picker;

@end

@implementation TWDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dateTextfiled.delegate = self;
    [self addDatePicker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self dateChange:_picker];
}

- (void)addDatePicker
{
    UIDatePicker *picker = [[UIDatePicker alloc]init];
    _picker = picker;
    picker.datePickerMode = UIDatePickerModeDate;
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    [picker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    _dateTextfiled.inputView = picker;
}

- (void)dateChange:(UIDatePicker *)picker
{
    self.dateTextfiled.text = [self StringfromDate: picker.date];
}

- (NSString *)StringfromDate:(NSDate *)date
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    return [fmt stringFromDate:date];
}

@end
