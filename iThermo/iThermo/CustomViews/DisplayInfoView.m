//
//  DisplayInfoView.m
//  iThermo
//
//  Created by Angus on 13-6-24.
//  Copyright (c) 2013年 xtremeprog.com. All rights reserved.
//
#define Display_size CGSizeMake(320, 282)
#define Label_CurrentTime_Frame CGRectMake(160.0f/2,100.0f/2,340.0f/2,35.0f/2)
#define Label_Temperature_Frame CGRectMake(127.0f/2,180.0f/2,430.0f/2,231.0f/2)
#define Label_Degree_Frame CGRectMake(432.0f/2,175.0f/2,70.0f,70.0f)
#define Label_DegreeUnit_Frame CGRectMake(478.0f/2,254.0f/2,95.0f,95.0f)

#define FontSize_Label_CurrentTime 20.0f
#define FontSize_Label_Temperature 160.0f
#define FontSize_Labe_Degree 70.0f
#define FontSize_Label_DegreeUnit 70.0f

#define Color_Label_CurrentTime [iPhoneTools colorWithHexString:@"#BBBBBB"]

#define Display_BrgImg @"home_display_bg"
#define Display_BrgImg_ScallingUp @"home_display_bg2"
#define Display_LabelBrgImg @"home_display_bg3"
#define Display_ScallingImg_UP @"home_display_scaling_up"
#define Display_ScallingImg_DOWN @"home_display_scaling_down"

#import "DisplayInfoView.h"

@implementation DisplayInfoView

-(void)dealloc{
    
    
    [_Layer_Brg release];
    self.Layer_Brg = nil;
    
    [_Label_CurrentTime release];
    self.Label_CurrentTime = nil;
    
    [_Label_Degree release];
    self.Label_Degree = nil;
    
    [_Label_Temperature release];
    self.Label_Temperature = nil;
    
    [_Label_Degree release];
    self.Label_Degree = nil;
    [_Label_DegreeUnit release];
    self.Label_DegreeUnit = nil;
    
    [_Label_Max release];
    self.Label_Max = nil;
    [_Label_Max_Value release];
    self.Label_Max_Value = nil;
    
    [_Label_Min release];
    self.Label_Min = nil;
    [_Label_Min_Value release];
    self.Label_Min_Value = nil;
    
    [_Label_Mean release];
    self.Label_Mean = nil;
    [_Label_Mean_Value release];
    self.Label_Mean_Value = nil;
    
    [_Label_Diff release];
    self.Label_Diff = nil;
    [_Label_Diff_Value release];
    self.Label_Diff_Value = nil;
    
    [_ScallingImageView release];
    self.ScallingImageView = nil;
    
    [super dealloc];
}

 


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}



-(void)InitUI{
    //Look Up for Digtal Font
    //[iPhoneTools ShowFontFromIOS];
    
    //init Brg Layer
    CALayer* aLayer_Brg = [[CALayer alloc]init];
    [aLayer_Brg setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [aLayer_Brg setContents:(id)[UIImage imageNamed:Display_BrgImg].CGImage];
    self.Layer_Brg = aLayer_Brg;
    [aLayer_Brg release];
    
    UILabel* aLabel_CurrentTime = [[UILabel alloc]initWithFrame:Label_CurrentTime_Frame];
    //向左对齐
    aLabel_CurrentTime.textAlignment = NSTextAlignmentLeft;
    //设置颜色
    aLabel_CurrentTime.textColor = Color_Label_CurrentTime;
    aLabel_CurrentTime.backgroundColor = [UIColor clearColor];
    //设置字体
    [aLabel_CurrentTime setFont:[UIFont fontWithName:Display_NumberFont size:FontSize_Label_CurrentTime]];
    self.Label_CurrentTime = aLabel_CurrentTime;
    [aLabel_CurrentTime release];
    
    UILabel* aLabel_Temperature = [[UILabel alloc]initWithFrame:Label_Temperature_Frame];
    //向左对齐
    aLabel_Temperature.textAlignment = NSTextAlignmentLeft;
    //设置颜色
    aLabel_Temperature.textColor = [UIColor whiteColor];
    aLabel_Temperature.backgroundColor = [UIColor clearColor];
    //设置字体
    [aLabel_Temperature setFont:[UIFont fontWithName:Display_NumberFont size:FontSize_Label_Temperature]];
    self.Label_Temperature = aLabel_Temperature;
    [aLabel_Temperature release];

    UILabel* alabel_Degree = [[UILabel alloc]initWithFrame:Label_Degree_Frame];
    //向左对齐
    alabel_Degree.textAlignment = NSTextAlignmentLeft;
    //设置颜色
    alabel_Degree.textColor = [UIColor whiteColor];
    alabel_Degree.backgroundColor = [UIColor clearColor];
    //设置字体
    [alabel_Degree setFont:[UIFont systemFontOfSize:FontSize_Labe_Degree]];
    self.Label_Degree = alabel_Degree;
    [alabel_Degree release];
    
    UILabel* alabel_DegreeUnit = [[UILabel alloc]initWithFrame:Label_DegreeUnit_Frame];
    //向左对齐
    alabel_DegreeUnit.textAlignment = NSTextAlignmentLeft;
    //设置颜色
    alabel_DegreeUnit.textColor = [UIColor whiteColor];
    alabel_DegreeUnit.backgroundColor = [UIColor clearColor];
    //设置字体
    [alabel_DegreeUnit setFont:[UIFont fontWithName:Display_NumberFont size:FontSize_Label_DegreeUnit]];
    self.Label_DegreeUnit = alabel_DegreeUnit;
    [alabel_DegreeUnit release];
    
    //Test For Demo Show
    self.Label_CurrentTime.text = [HOTEDateUtil stringCurrentDateWithFormat:DisplayDateFormat];
    self.Label_Temperature.text = @"86";
    self.Label_Degree.text = @"°";
    self.Label_DegreeUnit.text = @"C";
    
    [self.layer addSublayer:self.Layer_Brg];
    [self addSubview:self.Label_CurrentTime];
    [self addSubview:self.Label_Temperature];
    [self addSubview:self.Label_Degree];
    [self addSubview:self.Label_DegreeUnit];
    
}

-(id)initWithCGPoint:(CGPoint)point{
    self = [self initWithFrame:CGRectMake(point.x, point.y, Display_size.width, Display_size.height)];
    if(self){
        //Init UI
        [self InitUI];
    }
    return self;
}

//显示上缩下拉按钮
-(void)ShowScallingButton{

}

//点击往上拉事件
-(void)ClickScallingButton{
    if(_isScalling)return;
    
    if(_isDidScallUp){
    
    }else{
    
    
    }
    
}

//开启上缩动画
-(void)ScallUpBeginAnimation{

}

//开启下拉动画
-(void)ScallDownBeginAnimation{


}





@end
