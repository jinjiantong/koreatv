//
//  Manu.m
//  大神时刻
//
//  Created by jin chunhao on 14-3-2.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import "Manu.h"

@implementation Manu
@synthesize doter;
@synthesize newer;
@synthesize hoter;
@synthesize bgImg;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
         self.backgroundColor=[UIColor colorWithRed:57/250.0 green:49/250.0 blue:59/250.0 alpha:1 ];
        //self.backgroundColor=[UIColor UIButtonTypeInfoLight];
        doter=[UIButton buttonWithType:UIButtonTypeCustom];
        doter.frame=CGRectMake(0, 0, 320/3, self.frame.size.height);
        //[doter setTitle:@"大神" forState:(UIControlStateNormal)];
        //doter.titleLabel.font=[UIFont systemFontOfSize:16];
        //doter.titleLabel.backgroundColor=[UIColor clearColor];
        //[doter setTitleColor:[UIColor colorWithRed:253/250.0 green:244/250.0 blue:227/250.0 alpha:1] forState:UIControlStateNormal];
        doter.tag=0;
        [doter setBackgroundImage:[UIImage imageNamed:@"dashen"] forState:UIControlStateNormal];
        
        newer=[UIButton buttonWithType:UIButtonTypeCustom];
        newer.frame=CGRectMake(doter.frame.size.width, 0, 320/3, self.frame.size.height);
        //[newer setTitle:@"最新" forState:(UIControlStateNormal)];
//        newer.titleLabel.font=[UIFont systemFontOfSize:16];
//        newer.titleLabel.backgroundColor=[UIColor clearColor];
//        [newer setTitleColor:[UIColor colorWithRed:253/250.0 green:244/250.0 blue:227/250.0 alpha:1] forState:UIControlStateNormal];
        newer.tag=1;
        [newer setBackgroundImage:[UIImage imageNamed:@"zuixin"] forState:UIControlStateNormal];
        
        hoter=[UIButton buttonWithType:UIButtonTypeCustom];
        hoter.frame=CGRectMake(newer.frame.size.width*2, 0, 320/3, self.frame.size.height);
       // [hoter setTitle:@"最热" forState:(UIControlStateNormal)];
//        hoter.titleLabel.font=[UIFont systemFontOfSize:16];
//        hoter.titleLabel.backgroundColor=[UIColor clearColor];
//        [hoter setTitleColor:[UIColor colorWithRed:253/250.0 green:244/250.0 blue:227/250.0 alpha:1] forState:UIControlStateNormal];
        hoter.tag=2;
        [hoter setBackgroundImage:[UIImage imageNamed:@"remen"] forState:UIControlStateNormal];
        
        bgImg=[[UIView alloc] initWithFrame:doter.frame];
        //bgImg.backgroundColor=[UIColor colorWithRed:255/250.0 green:127/250.0 blue:102/250.0 alpha:0.6];
        
        bgImg.backgroundColor=[UIColor colorWithRed:115/250.0 green:49/250.0 blue:108/250.0 alpha:0.4];
        [self addSubview:bgImg];
        
        [self addSubview:doter];
        [self addSubview:newer];
        [self addSubview:hoter];
        
      
       
    }
    
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

