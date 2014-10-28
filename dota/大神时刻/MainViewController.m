//
//  MainViewController.m
//  大神时刻
//
//  Created by jin chunhao on 14-3-1.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import "MainViewController.h"
#import "MainRequestView.h"
#import "NavView.h"
#import "Manu.h"
#import <MediaPlayer/MediaPlayer.h>
@interface MainViewController ()

@end

@implementation MainViewController
@synthesize  manu;
@synthesize doter;
@synthesize scrool;
@synthesize recent;
@synthesize playvc;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         ADD_OBSERVER(self, @selector(DataSource:), @"DataSource", nil);
         ADD_OBSERVER(self, @selector(HotDataSource:), @"HotDataSource", nil);
        ADD_OBSERVER(self, @selector(NewDataSource:), @"NewDataSource", nil);
        ADD_OBSERVER(self, @selector(ShowPlayView:), @"getURL", nil);
     
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    MainRequestView * main=[[MainRequestView alloc] initWithFrame:CGRectMake(-320, 0, 10, 10)];
    main.alpha=0;
    [main setRequestWithURL:BASEURL];
    [self.view addSubview:main];
    
   
    
    NavView * nav=[[NavView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    [self.view addSubview:nav];
    
     manu=[[Manu alloc] initWithFrame:CGRectMake(0, nav.frame.size.height, 320, 30)];
    [manu.doter addTarget:self action:@selector(menuAcion:) forControlEvents:(UIControlEventTouchUpInside)];
    [manu.hoter addTarget:self action:@selector(menuAcion:) forControlEvents:(UIControlEventTouchUpInside)];
    [manu.newer addTarget:self action:@selector(menuAcion:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    [self.view addSubview:manu];
    
    
    scrool=[[UIScrollView alloc] initWithFrame:CGRectMake(0, manu.frame.size.height+manu.frame.origin.y, 320, self.view.frame.size.height-manu.frame.size.height-manu.frame.origin.y)];
    scrool.pagingEnabled=YES;
    scrool.scrollEnabled=YES;
    scrool.showsVerticalScrollIndicator=NO;
    scrool.showsHorizontalScrollIndicator=NO;
    scrool.delegate=self;
    scrool.backgroundColor=[UIColor clearColor];
    [scrool setContentSize:CGSizeMake(320*3,scrool.frame.size.height )];
    
    [self.view addSubview:scrool];
    
    
    doter=[[Doter alloc] initWithFrame:CGRectMake(0, 0, 320, scrool.frame.size.height)];
    
    hot=[[Hot alloc] initWithFrame:CGRectMake(640,0, 320, scrool.frame.size.height)];
    
    recent=[[New alloc] initWithFrame:CGRectMake(320,0, 320, scrool.frame.size.height)];
    
   [scrool addSubview:doter];
   [scrool addSubview:hot];
   [scrool addSubview:recent];
	// Do any additional setup after loading the view.
}

- (void)DataSource:(NSNotification *)notification
{
    NSDictionary * dic=(NSDictionary *)[notification object];
    NSMutableArray * dataSourc=[dic objectForKey:@"doterArr"];
    [doter detData:dataSourc];
}

-(void) HotDataSource:(NSNotification *)notification
{

    NSDictionary * dic=(NSDictionary *)[notification object];
    NSMutableArray * dataSourc=[dic objectForKey:@"doterArr"];
    [hot detData:dataSourc];
    //[doter detData:dataSourc];

}
-(void) NewDataSource:(NSNotification *)notification
{
    
    NSDictionary * dic=(NSDictionary *)[notification object];
    NSMutableArray * dataSourc=[dic objectForKey:@"doterArr"];
    [recent detData:dataSourc];
    
}

-(void) ShowPlayView:(NSNotification *)notification
{
    
    NSDictionary * dic=(NSDictionary *)[notification object];
    NSString * palyUrl=[dic objectForKey:@"getURL"];
    [self playMovie:palyUrl];
  
}
-(void) menuAcion:(UIButton *) btn
{
  //  CGRect  rec=btn.frame;
    
    CGPoint point;
    switch (btn.tag)
    {
        case 0:
           
            //rec=manu.doter.frame;
            point=CGPointMake(0, 0);
        
            break;
            
        case 1:
            
           // rec=manu.newer.frame;
            point=CGPointMake(320,  0);
            break;
            
        case 2:
            
            //rec=manu.hoter.frame;
             point=CGPointMake(640,  0);
            break;
            
        default:
            break;
    }
    
     [scrool setContentOffset:point animated:YES];
    
//       [UIView animateWithDuration:0.4 animations:^{
//        manu.bgImg.frame=rec;
//    } completion:^(BOOL finished) {
//        
//    }];

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
     CGRect  rec;
    float offsetx=scrollView.contentOffset.x;
    if(offsetx>=160 && offsetx<=480)
    {
        rec=manu.newer.frame;
    
    }
    if(offsetx<320/2)
    {
      rec=manu.doter.frame;
    
    }
    if(offsetx>480)
    {
        rec=manu.hoter.frame;
        
    }
    
    [UIView animateWithDuration:0.4 animations:^{
        manu.bgImg.frame=rec;
    } completion:^(BOOL finished) {
        
    }];

}

/**
 @method 播放电影
 */
-(void)playMovie:(NSString *)path
{
    playvc=[[PlayViewController alloc] init];
    NSLog(@"view==%@",playvc.view) ;
    [playvc gotoPlay:path];
   [self presentViewController:playvc animated:YES completion:^{
       
   }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
