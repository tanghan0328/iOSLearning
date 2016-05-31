//
//  MySlidersView.h
//  iOSLearning
//
//  Created by tang on 16/3/17.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define VOLUME_TAG_IMAGE        [UIImage imageNamed:@"tag.png"]
#define STETCH_LEFT_TRACK   [UIImage imageNamed:@"max"];
#define STETCH_RIGHT_TRACK  [UIImage imageNamed:@"min"];

@interface MySlidersView : UIView
{
    UIImage *stetchLeftTrack;
    UIImage *stetchRightTrack;
    UIImageView *tagView;
    UIImageView *bottomView;
    UIImageView *topView;
}
@end
