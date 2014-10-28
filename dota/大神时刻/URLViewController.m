//
//  MainRequestView.m
//  大神时刻
//
//  Created by jin chunhao on 14-3-2.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import "URLViewController.h"
#import "RegexKitLite.h"
#import "Main.h"
@implementation URLViewController
@synthesize requestWebView=_requestWebView;
@synthesize html;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        ifOk=NO;
        ifHotOk=NO;
        ifnewOk=NO;
        
        _requestWebView=[[ IMTWebView alloc]initWithFrame:self.frame];
        _requestWebView.progressDelegate=self;
        _requestWebView.delegate=self;
        [self addSubview:_requestWebView];
        // Initialization code
    }
    return self;
}
-(void) setRequestWithURL:(NSString *) urlStr
{
    ifgetURLok=NO;
    NSURL * url=[NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:14];
    [request setValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:27.0) Gecko/20100101 Firefox/27.0" forHTTPHeaderField:@"User-Agent"];
    [_requestWebView loadRequest:request];
    
    
}


-(void) GetURLFactory:(NSString *) myhtml
{
    
    
    if(myhtml==nil)
    {
        return;
    }
    NSString * getURLRig  = [NSString stringWithFormat:@"%@",@"src=\"[\\s\\S]*?\""];
    NSString * getURL=[myhtml stringByMatching:getURLRig];
    if(getURL)
    {
        getURL=[getURL substringWithRange:NSMakeRange(4, [getURL length]-1-4)];
        
        getURL=[getURL stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    }
    // NSLog(@"getDoter==%@",getDoter);
    
//   <embed width="100%" height="100%" align="middle" type="application/x-shockwave-flash" mode="transparent" allowfullscreen="true" allowscriptaccess="always" quality="high" src="http://player.youku.com/player.php/sid/XNjg0NTgwODEy/v.swf">    
    NSString * palyUrl  = [NSString stringWithFormat:@"%@",@"sid/[\\s\\S]*?/v"];
    // NSLog(@"palyUrl===%@",palyUrl);
    NSString *  ienty=[getURL stringByMatching:palyUrl];
    ienty=[ienty stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    ienty=[ienty substringWithRange:NSMakeRange(4, [ienty length]-4-2)];
    getURL=[NSString stringWithFormat:@"http://v.youku.com/player/getRealM3U8/vid/%@/v/type/video.m3u8",ienty];
    

    NSDictionary * dic=[NSDictionary dictionaryWithObject:getURL forKey:@"getURL"];
    POST_NOTIFICATION(@"getURL", dic, nil);
    
    
    

}

//获取数组

-(NSMutableArray *) getRegexWithString:(NSString *) reg  andResource:(NSString *)resourse
{
    
    
    NSMutableArray * resultArr=[NSMutableArray array];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:reg
                                  
                                                                           options:NSRegularExpressionCaseInsensitive
                                  
                                                                             error:nil];
    
    NSArray *matches = [regex matchesInString:resourse  options:0 range:NSMakeRange(0, [resourse length])];
    for (NSTextCheckingResult *match in matches)
    {
        
        NSRange matchRange = [match range];
        
        NSString *tagString = [resourse substringWithRange:matchRange];  // 整个匹配串
        
        [resultArr addObject:tagString];
    }
    
    return resultArr;
    
}

- (void) webView:(IMTWebView*)webView didReceiveResourceNumber:(int)resourceNumber totalResources:(int)totalResources
{
    if(!ifgetURLok)
    {
        
        NSString * ifHaveHot=@" function checkHotPro(){ var tags= document.getElementById('divPlayer'); var arr=tags.getElementsByTagName('embed'); if(arr.length>0){  return true; }else{  return false;  }}";
        
        [_requestWebView stringByEvaluatingJavaScriptFromString:ifHaveHot];
        NSString * ifHasnwetPro= [_requestWebView stringByEvaluatingJavaScriptFromString:@"checkHotPro();"];
        
        if([ifHasnwetPro isEqualToString:@"true"])
        {
            
            NSString * js=@"document.getElementById('divPlayer').innerHTML";
            NSString * myhtl= [_requestWebView stringByEvaluatingJavaScriptFromString:js];
           // NSLog(@"html==%@",myhtl);
            [self GetURLFactory:myhtl];
            ifgetURLok=YES;
        }
        
        
        
    }
    
}
#pragma UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    return YES;
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
   }
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    if([error code] == NSURLErrorCancelled)
        
    {
        
        return;
        
    }
    NSLog(@"errrer===%@",error.description);
    
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
