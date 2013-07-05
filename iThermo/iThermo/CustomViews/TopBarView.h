//
//  TopBarView.h
//  iThermo
//
//  Created by xpg on 13-6-24.
//  Copyright (c) 2013年 xtremeprog.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>//使用Layer需要导入QuartzCore库

@interface TopBarView : UIView

@property(strong,nonatomic) UIButton* Button_Left;
@property(strong,nonatomic) UIButton* Button_Right;
//不与用户交互的组件采用Layer
@property(strong,nonatomic) CALayer* layer_Top;

//自定义有参的构造方法  frame   leftImg 左图标  LeftImg_Down 左图标(DOWN)  TopBrgImg 顶部背景图片
-(id)initWithFrame:(CGRect)frame LeftImg:(UIImage*)leftImg LeftImg_Down:(UIImage*)leftImg_Down TopBrgImg:(UIImage*)brgImage;
 

@end
