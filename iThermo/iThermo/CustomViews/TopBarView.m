//
//  TopBarView.m
//  iThermo
//
//  Created by xpg on 13-6-24.
//  Copyright (c) 2013年 xtremeprog.com. All rights reserved.
//

//组件的坐标(与量出的坐标除2)
#define Layer_TopBar_Height 44.0f
 
#define Button_Left_x 265.5f
#define Button_Left_y 5.0f/2
#define Button_Left_Width 111.0f/2
#define Button_Left_Height 87.0f/2 


#import "TopBarView.h"

@implementation TopBarView

-(void)dealloc{
    [_Button_Left release];
    self.Button_Left = nil;
    
    [_Button_Right release];
    self.Button_Right = nil;
    
    [_layer_Top release];
    self.layer_Top = nil;
    
    [super dealloc];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame LeftImg:(UIImage *)leftImg LeftImg_Down:(UIImage *)leftImg_down TopBrgImg:(UIImage *)brgImage{
    
    self = [super initWithFrame:frame];
    
    //初始化组件
    CALayer* aLayer_top = [[CALayer alloc]init];
    [aLayer_top setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Layer_TopBar_Height)];
    self.layer_Top = aLayer_top;
    [aLayer_top release];
    
    UIButton* abutton_Left = [[UIButton alloc]init];
    [abutton_Left setFrame:CGRectMake(Button_Left_x, Button_Left_y, Button_Left_Width, Button_Left_Height)];
    self.Button_Left = abutton_Left;
    [abutton_Left release];
    
    //配图
    if(leftImg){
        [self.Button_Left setImage:leftImg forState:UIControlStateNormal];
    }
    
    if(leftImg_down){
        [self.Button_Left setImage:leftImg_down forState:UIControlStateHighlighted];
    }
    
    if(brgImage){
        [aLayer_top setContents:(id)brgImage.CGImage];
    }
    
    //按叠加顺序添加
    [self.layer addSublayer:self.layer_Top];
    [self addSubview:self.Button_Left];
    
    return self;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
