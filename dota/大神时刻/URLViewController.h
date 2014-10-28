//
//  URLViewController.h
//  大神时刻
//
//  Created by jin chunhao on 14-3-13.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMTWebView.h"
@interface URLViewController : UIView<IMTWebViewProgressDelegate,UIWebViewDelegate>
{
    
    IMTWebView * _requestWebView;
    BOOL  ifOk;
    BOOL  ifHotOk;
    BOOL  ifnewOk;
    BOOL  ifgetURLok;

    NSString * html;
}
@property (nonatomic,retain) IMTWebView * requestWebView;
@property (nonatomic,strong)  NSString * html;
-(void) setRequestWithURL:(NSString *) urlStr;
@end