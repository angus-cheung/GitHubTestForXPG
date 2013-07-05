//
//  iThermoViewController.h
//  iThermo
//
//  Created by xpg on 13-6-24.
//  Copyright (c) 2013年 xtremeprog.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopBarView.h"
#import "DisplayInfoView.h"
#import <QuartzCore/QuartzCore.h>


@interface iThermoViewController : UIViewController
//No OutLet Componet
@property(strong,nonatomic) TopBarView* topBarView;
@property(strong,nonatomic) CALayer* Layer_Brg;
@property(strong,nonatomic) DisplayInfoView* displayInfoView;

//With OutLet Componet
@property(strong,nonatomic) IBOutlet UIButton* Button_Record;
@property(strong,nonatomic) IBOutlet UIButton* Button_Case;
@property(strong,nonatomic) IBOutlet UIButton* Button_History;
@property(strong,nonatomic) IBOutlet UIButton* Button_Mode;
@property(strong,nonatomic) IBOutlet UIButton* Button_More;


@end
