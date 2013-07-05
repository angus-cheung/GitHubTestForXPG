//
//  DisplayInfoView.h
//  iThermo
//
//  Created by Angus on 13-6-24.
//  Copyright (c) 2013年 xtremeprog.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "iPhoneTools.h"

@interface DisplayInfoView : UIView

@property(strong,nonatomic)CALayer* Layer_Brg;
@property(strong,nonatomic)UILabel* Label_CurrentTime;
@property(strong,nonatomic)UILabel* Label_Temperature;
@property(strong,nonatomic)UILabel* Label_Degree;
@property(strong,nonatomic)UILabel* Label_DegreeUnit;
//Max Min Mean Diff.
@property(strong,nonatomic)UILabel* Label_Max;
@property(strong,nonatomic)UILabel* Label_Max_Value;
@property(strong,nonatomic)UILabel* Label_Min;
@property(strong,nonatomic)UILabel* Label_Min_Value;
@property(strong,nonatomic)UILabel* Label_Mean;
@property(strong,nonatomic)UILabel* Label_Mean_Value;
@property(strong,nonatomic)UILabel* Label_Diff;
@property(strong,nonatomic)UILabel* Label_Diff_Value;

@property(strong,nonatomic)UIImageView* ScallingImageView;

@property BOOL isDidScallUp;
@property BOOL isScalling;

-(id)initWithCGPoint:(CGPoint)point;

@end
