//
//  Doter.h
//  大神时刻
//
//  Created by jin chunhao on 14-3-2.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Doter : UITableView<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * dataSourc;
}
@property (nonatomic,strong)  NSMutableArray * dataSourc;
-(void) detData:(NSMutableArray *) data;
@end
