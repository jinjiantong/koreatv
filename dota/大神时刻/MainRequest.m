//
//  MainRequest.m
//  大神时刻
//
//  Created by jin chunhao on 14-3-2.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import "MainRequest.h"
#import "ASIHTTPRequest.h"
@implementation MainRequest
+(NSMutableArray *) getRequetWithUrl:(NSString * ) Url
{

    NSMutableArray * resultArr=[[NSMutableArray alloc] init];
   __block NSString * respondesStr=nil;
    
    NSURL * getURL=[NSURL URLWithString:Url];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:getURL];
    [request setCompletionBlock:^{
        // Use when fetching text data
        respondesStr= [request responseString];
        NSLog(@"string==%@",respondesStr);
        //[Factory getCurrentProListResultForArray:_yuleRespondesStr];
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        NSLog(@"%@",error.description);
    }];
    [request startAsynchronous];
    
    return  resultArr;

}
@end
