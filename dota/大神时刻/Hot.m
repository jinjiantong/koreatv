//
//  Hot.m
//  大神时刻
//
//  Created by jin chunhao on 14-3-8.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import "Hot.h"
#import "DoterCell.h"
#import "Main.h"
#import "EGOImageLoader.h"

@implementation Hot
@synthesize dataSourc;
@synthesize urlViewController;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.delegate=self;
        self.dataSource=self;
        dataSourc=[[NSMutableArray alloc] init];
        self.tableFooterView = [[UIView alloc]init];
        urlViewController=[[URLViewController alloc] init];
        // Initialization code
    }
    return self;
}

-(void) detData:(NSMutableArray *) data
{
    dataSourc=data;
    [self reloadData];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [dataSourc count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *additivesListcellIdentifier = @"doter";
    //    //此处cell换成自定义的
    DoterCell *doter=[tableView dequeueReusableCellWithIdentifier:additivesListcellIdentifier];
    
    if(doter==nil)
    {
        doter=[[DoterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:additivesListcellIdentifier];
        
    }
    Main * main=[dataSourc objectAtIndex:indexPath.row];
    if(main.imgUrl)
    {
        
        doter.imageView.image=[[EGOImageLoader sharedImageLoader] imageForURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",main.imgUrl]]shouldLoadWithObserver: nil];
    }
    else
    {
        doter.imageView.image=[UIImage imageNamed:@"js"];;
    }
    
    doter.doterName.text=main.name;
    
    return doter;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Main* mymain=[dataSourc objectAtIndex:indexPath.row];
    NSLog(@"url==%@",mymain.detailUrl);
    [urlViewController setRequestWithURL:mymain.detailUrl];
//    MainRequestView * requestView= [[MainRequestView alloc] init];
//    [requestView setRequestWithURL:mymain.detailUrl];
    
}

//滑动取消键盘
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
