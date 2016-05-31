//
//  MySlidersView.m
//  iOSLearning
//
//  Created by tang on 16/3/17.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "MySlidersView.h"

@implementation MySlidersView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    stetchRightTrack = STETCH_RIGHT_TRACK;  //[UIImage imageNamed:@"stetchRightTrack.png"] ;
    stetchLeftTrack = STETCH_LEFT_TRACK;    //[UIImage imageNamed:@"stetchLeftTrack.png"] ;
    bottomView= [[UIImageView alloc] initWithImage:stetchRightTrack];
    [bottomView setFrame:CGRectMake(0, 0, 247, 55)];
    
    topView= [[UIImageView alloc] initWithImage:stetchLeftTrack];
    [topView setFrame:CGRectMake(0, 0, 247, 55)];
    
    
    [self addSubview:bottomView];
    [self addSubview:topView];
    
    tagView = [[UIImageView alloc] initWithImage:VOLUME_TAG_IMAGE];
    tagView.frame = CGRectMake(213,0 , 26, 42);
    
    UIPanGestureRecognizer* panRecognizer;
    panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(volumeSliderChange:)];
    tagView.userInteractionEnabled = YES;
    [tagView addGestureRecognizer:panRecognizer];
    [self addSubview:tagView];
}

- (void)volumeSliderChange:(id)sender
{
    NSLog(@"===volumeSliderChange==========");
    UIPanGestureRecognizer *gesture = sender;
    CGPoint point = [gesture locationInView:self];
    NSLog(@"  point.x======%f=*****point.x***%f***=",point.x,point.y);
    
    if(point.x > 213){
        point.x = 213;
    }else if(point.x < 0){
        point.x = 0;
    }
    
    tagView.frame = CGRectMake(point.x, 0, 26, 42);
    
    int gap;
    gap = 2;
    UIImage* image;
    CGRect frame;
    NSUInteger width;
    width = point.x;
    frame = CGRectMake(0, 0, width, 55);
    image = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([stetchLeftTrack CGImage], frame)];
    topView.image = image;
    topView.frame = CGRectMake(0, 0, width + gap, 55);
}
@end
