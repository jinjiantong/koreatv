//
//  MainViewController.h
//  大神时刻
//
//  Created by jin chunhao on 14-3-1.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doter.h"
#import "Hot.h"
#import "New.h"
#import "PlayViewController.h"
@class Manu ;
@interface MainViewController : UIViewController<UIScrollViewDelegate>
{
    Manu * manu;
    Doter * doter;
    Hot * hot;
    New * recent;
    
    UIScrollView * scrool;
    PlayViewController * playvc;

}
@property (nonatomic,strong) Manu * manu;
@property (nonatomic,strong) Doter * doter;
@property (nonatomic,strong) Hot * hot;
@property (nonatomic,strong) New * recent;
@property (nonatomic,strong) UIScrollView * scrool;
@property (nonatomic,strong)  PlayViewController * playvc;
@end
