//
//  Hot.h
//  大神时刻
//
//  Created by jin chunhao on 14-3-8.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URLViewController.h"
@interface Hot : UITableView<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * dataSourc;
    URLViewController * urlViewController;
}
@property (nonatomic,strong)  NSMutableArray * dataSourc;
@property(nonatomic,strong) URLViewController * urlViewController;
-(void) detData:(NSMutableArray *) data;
@end
