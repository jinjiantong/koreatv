//
//  PlayViewController.h
//  koreaTV
//
//  Created by jin chunhao on 14-2-4.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PlayViewController : UIViewController<UIWebViewDelegate>
{

    UIWebView * _webview;
    
}

@property  (nonatomic,strong)  UIWebView * webview;
-(void) gotoPlay:(NSString *) playUrl;
@end
