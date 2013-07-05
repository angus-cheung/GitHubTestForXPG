//
//  iThermoViewController.m
//  iThermo
//
//  Created by xpg on 13-6-24.
//  Copyright (c) 2013年 xtremeprog.com. All rights reserved.
//
#define home_SettingImg @"button_setting"
#define home_SettingImg_Down @"button_setting_down"
#define home_TopBarBrgImg @"HomeTopBar"
#define home_BrgImg @"Home_Brg"
#define home_TopBar_Height 44.0f
#define home_DisplayInfoView_CGPoint CGPointMake(0.0f/2, 63.0f/2)
 

#import "iThermoViewController.h"
#import "iPhoneTools.h"

@interface iThermoViewController ()

@end

@implementation iThermoViewController

-(void)dealloc{
    
    
    [self.topBarView.Button_Left removeTarget:self action:@selector(ClickSettingButton) forControlEvents:UIControlEventTouchUpInside];
    [self.Button_Case removeTarget:self action:@selector(ClickCaseButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.Button_History removeTarget:self action:@selector(ClickHistoryButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.Button_Mode removeTarget:self action:@selector(ClickModeButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.Button_More removeTarget:self action:@selector(ClickMoreButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.Button_Record removeTarget:self action:@selector(ClickRecordButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_topBarView release];
    self.topBarView = nil;
    
    [_Button_Case release];
    self.Button_Case = nil;
    
    [_Button_History release];
    self.Button_History = nil;
    
    [_Button_Mode release];
    self.Button_Mode = nil;
    
    [_Button_More release];
    self.Button_More = nil;
    
    [_Button_Record release];
    self.Button_Record = nil;
    
    [_topBarView release];
    self.topBarView = nil;
    
    [_Layer_Brg release];
    self.Layer_Brg = nil;
    
    [_displayInfoView release];
    self.displayInfoView = nil;
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
               
    }
    return self;
}


-(void)initUI{
    
    
    
    //init TopBar View
    UIImage* leftImg = [UIImage imageNamed:home_SettingImg];
    UIImage* leftImg_down = [UIImage imageNamed:home_SettingImg_Down];
    UIImage* topBrgImg = [UIImage imageNamed:home_TopBarBrgImg];
    
    TopBarView* aTopBarView = [[TopBarView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, home_TopBar_Height) LeftImg:leftImg LeftImg_Down:leftImg_down TopBrgImg:topBrgImg];
    self.topBarView = aTopBarView;
    [aTopBarView release];
    
    [self.topBarView.Button_Left addTarget:self action:@selector(ClickSettingButton) forControlEvents:UIControlEventTouchUpInside];
    
    //init DisplayInfoView
    DisplayInfoView* aDisplayInfoView = [[DisplayInfoView alloc]initWithCGPoint:CGPointMake(home_DisplayInfoView_CGPoint.x, home_DisplayInfoView_CGPoint.y)];
    self.displayInfoView = aDisplayInfoView;
    [aDisplayInfoView release];
    
    //init Brg Layer
    CALayer* alayer_Brg = [[CALayer alloc]init];
    [alayer_Brg setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    [alayer_Brg setContents:(id)[UIImage imageNamed:home_BrgImg].CGImage];
    self.Layer_Brg = alayer_Brg;
    [alayer_Brg release];

    
    
    //Remove Nib Componets
    [self.Button_Case removeFromSuperview];
    [self.Button_History removeFromSuperview];
    [self.Button_Mode removeFromSuperview];
    [self.Button_More removeFromSuperview];
    [self.Button_Record removeFromSuperview];
    
    
    [self.view.layer addSublayer:self.Layer_Brg];
    [self.view addSubview:self.topBarView];
    [self.view addSubview:self.displayInfoView];
    
    //Recover Nib Componets
    [self.view addSubview:self.Button_Case];
    [self.view addSubview:self.Button_History];
    [self.view addSubview:self.Button_Mode];
    [self.view addSubview:self.Button_More];
    [self.view addSubview:self.Button_Record];
    

}




- (void)viewDidLoad
{
    [super viewDidLoad];
    //init UI Componet
    [self initUI];
}

-(void)ClickSettingButton{
    
   // NSLog(@" Home Click Setting Button ");
    
    
}

-(IBAction)ClickRecordButton:(id)sender{
    
}

-(IBAction)ClickCaseButton:(id)sender{
    
}

-(IBAction)ClickHistoryButton:(id)sender{
    
}

-(IBAction)ClickModeButton:(id)sender{
    
}

-(IBAction)ClickMoreButton:(id)sender{
    
}

 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
