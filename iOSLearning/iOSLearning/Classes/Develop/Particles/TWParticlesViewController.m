//
//  TWParticlesViewController.m
//  iOSLearning
//
//  Created by tang on 16/5/30.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWParticlesViewController.h"
#import "TWDrawView.h"

@interface TWParticlesViewController ()

@property (strong, nonatomic) IBOutlet TWDrawView *drawView;
@end

@implementation TWParticlesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onAnimaStart:(id)sender
{
    TWDrawView *view = (TWDrawView *)self.drawView;
    [view startAnim];
}


- (IBAction)onReload:(id)sender
{
    TWDrawView *view = (TWDrawView *)self.drawView;
    [view reDraw];
}

@end
