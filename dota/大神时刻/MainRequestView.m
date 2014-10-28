//
//  MainRequestView.m
//  大神时刻
//
//  Created by jin chunhao on 14-3-2.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import "MainRequestView.h"
#import "RegexKitLite.h"
#import "Main.h"
@implementation MainRequestView
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
    NSURL * url=[NSURL URLWithString:urlStr];
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:14];
     [request setValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:27.0) Gecko/20100101 Firefox/27.0" forHTTPHeaderField:@"User-Agent"];
    [_requestWebView loadRequest:request];
    
 
}


-(void) HotURLFactory:(NSString *) myhtml
{
    
    
    if(myhtml==nil)
    {
        return;
    }
    NSString * getDoterRig  = [NSString stringWithFormat:@"%@",@"<ul style=\"position: absolute;\">[\\s\\S]*?</ul></div>"];
    NSString * getDoter=[myhtml stringByMatching:getDoterRig];
    // NSLog(@"getDoter==%@",getDoter);
    
    NSString * getPerDoterRig  = [NSString stringWithFormat:@"%@",@"<li>[\\s\\S]*?</li>"];
    NSMutableArray * resutlArr=[self getRegexWithString:getPerDoterRig andResource:getDoter];
    
    NSMutableArray * doterArr=[[NSMutableArray alloc] init];
    if(resutlArr)
    {
        
        
        NSString * imgUrlReg=[NSString stringWithFormat:@"%@",@"<img src=\"[\\s\\S]*?\""];
        NSString * getURLReg  = [NSString stringWithFormat:@"%@",@"href=\"[\\s\\S]*?\""];
        NSString * getNAMEReg  = [NSString stringWithFormat:@"%@",@"title=\"[\\s\\S]*?\""];
        NSString * getDetailurl;
        NSString * getName;
        NSString * imgURl;
        
        for (NSString * str in  resutlArr)
        {
            Main * mian=[[Main alloc] init];
            
            NSString * temp=[NSString stringWithFormat:@"%@",str];
            
            getDetailurl=[temp stringByMatching:getURLReg];
            
            if(getDetailurl)
            {
                getDetailurl=[getDetailurl substringWithRange:NSMakeRange(6, [getDetailurl length]-1-6)];
                
                getDetailurl=[getDetailurl stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                
                getDetailurl=[getDetailurl stringByReplacingOccurrencesOfString:@"amp;" withString:@""];
                
                mian.detailUrl=[NSString stringWithFormat:@"%@%@",BASETWOURL,getDetailurl];
            }
            
            getName=[temp stringByMatching:getNAMEReg];
            
            if(getName)
            {
                
                getName=[getName substringWithRange:NSMakeRange(7, [getName length]-1-7)];
                
                getName=[getName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                mian.name=getName;
            }
            
            
            imgURl=[temp stringByMatching:imgUrlReg];
            
            if(imgURl)
            {
                imgURl=[imgURl substringWithRange:NSMakeRange(10, [imgURl length]-1-10)];
                
                imgURl=[imgURl stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                mian.imgUrl=imgURl;
                
            }
            
            [doterArr addObject:mian];
            
            NSLog(@"imgURl-%@",imgURl);
            NSLog(@"name-%@",getName);
            NSLog(@"url=%@",getDetailurl);
        }
        
    }
    
    NSDictionary * dic=[NSDictionary dictionaryWithObject:doterArr forKey:@"doterArr"];
    POST_NOTIFICATION(@"HotDataSource", dic, nil);
    
    
    
    
}

//<ul><li><strong><span>南风</span><em>1天前</em></strong><div class="video-on"><p><a href="play.aspx?id=802&amp;game=10001" target="_blank">【南风解说】DOTA学姐学妹杯 第二盘 名导与民间大神的激战</a></p><div class="video-box"><a href="play.aspx?id=802&amp;game=10001" target="_blank"><img src="http://pic.7fgame.com//WTVupFiles/201403/07/small_0_1e251bb39141425d9c8bcb2fe65ca5f7.jpg" width="142" height="90" alt=""><span><i>36:15</i></span></a></div></div></li><li><strong><span>少男乖</span><em>1天前</em></strong><div class="video-on"><p><a href="play.aspx?id=801&amp;game=10001" target="_blank">【小乖dota】高分局刷新宙斯暴力风行</a></p><div class="video-box none"><a href="play.aspx?id=801&amp;game=10001" target="_blank"><img src="http://pic.7fgame.com//WTVupFiles/201403/07/small_0_a527c9a9566742089057552498572a4d.jpg" width="142" height="90" alt=""><span><i>76:37</i></span></a></div></div></li><li><strong><span>2009</span><em>1天前</em></strong><div class="video-on"><p><a href="play.aspx?id=800&amp;game=10001" target="_blank">【09DOTA】零单第三季42-44：飞机龙鹰土猫</a></p><div class="video-box none"><a href="play.aspx?id=800&amp;game=10001" target="_blank"><img src="http://pic.7fgame.com//WTVupFiles/201403/07/small_0_57ade125c8704fa690b42b2642ee891c.jpg" width="142" height="90" alt=""><span><i>79:19</i></span></a></div></div></li><li><strong><span>情书</span><em>1天前</em></strong><div class="video-on"><p><a href="play.aspx?id=799&amp;game=10001" target="_blank">【情书DOTA】260力5000血屠夫神装大战!</a><
-(void) NEWURLFactory:(NSString *) myhtml
{
  
    
    if(myhtml==nil)
    {
        return;
    }
    NSString * getDoterRig  = [NSString stringWithFormat:@"%@",@"<div id=\"divLatestList\"[\\s\\S]*?</ul></div>"];
    NSString * getDoter=[myhtml stringByMatching:getDoterRig];
    NSLog(@"getDoter==%@",getDoter);
    
    NSString * getPerDoterRig  = [NSString stringWithFormat:@"%@",@"<li>[\\s\\S]*?</li>"];
    NSMutableArray * resutlArr=[self getRegexWithString:getPerDoterRig andResource:getDoter];
    
    NSMutableArray * doterArr=[[NSMutableArray alloc] init];
    if(resutlArr)
    {
        
//        <li><div class="hero-l"><a href="play.aspx?relation=1&amp;game=10001" target="_blank"><img src="http://pic.7fgame.com//WTVupFiles/201401/10/small_316051665_f61af5b1773b483aaaa36e03955bea85.jpg" width="65" height="65" alt="2009"></a></div><div class="hero-r"><a href="play.aspx?relation=1&amp;game=10001" target="_blank">2009</a><span>全部视频：<i>49</i></span><span>最新更新：<em>1天前</em></span></div></li>,
        
        NSString * imgUrlReg=[NSString stringWithFormat:@"%@",@"<img src=\"[\\s\\S]*?\""];
        NSString * getURLReg  = [NSString stringWithFormat:@"%@",@"href=\"[\\s\\S]*?\""];
        NSString * getNAMEReg  = [NSString stringWithFormat:@"%@",@"k\">[\\s\\S]*?</a>"];
        NSString * getDetailurl;
        NSString * getName;
        NSString * imgURl;
        
        for (NSString * str in  resutlArr)
        {
            Main * mian=[[Main alloc] init];
            
            NSString * temp=[NSString stringWithFormat:@"%@",str];
            
            getDetailurl=[temp stringByMatching:getURLReg];
            
            if(getDetailurl)
            {
                getDetailurl=[getDetailurl substringWithRange:NSMakeRange(6, [getDetailurl length]-1-6)];
                
                getDetailurl=[getDetailurl stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                
                getDetailurl=[getDetailurl stringByReplacingOccurrencesOfString:@"amp;" withString:@""];
               
                mian.detailUrl=[NSString stringWithFormat:@"%@%@",BASETWOURL,getDetailurl];
            }
            
            getName=[temp stringByMatching:getNAMEReg];
            
            if(getName)
            {
                
                getName=[getName substringWithRange:NSMakeRange(3, [getName length]-3-4)];
                
                getName=[getName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                mian.name=getName;
            }
            
            
            imgURl=[temp stringByMatching:imgUrlReg];
            
            if(imgURl)
            {
                imgURl=[imgURl substringWithRange:NSMakeRange(10, [imgURl length]-1-10)];
                
                imgURl=[imgURl stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                mian.imgUrl=imgURl;
            
            }
            
            [doterArr addObject:mian];
              NSLog(@"i===========");
            NSLog(@"imgURl-%@",imgURl);
            NSLog(@"name-%@",getName);
            NSLog(@"url=%@",getDetailurl);
        }
        
    }
    
    NSDictionary * dic=[NSDictionary dictionaryWithObject:doterArr forKey:@"doterArr"];
    POST_NOTIFICATION(@"NewDataSource", dic, nil);
    

    

}
-(void) URLFactory:(NSString *) myhtml
{
    
    if(myhtml==nil)
    {
        return;
    }
    NSString * getDoterRig  = [NSString stringWithFormat:@"%@",@"<ul class=\"w300 bor525252\">[\\s\\S]*?</ul>"];
    NSString * getDoter=[myhtml stringByMatching:getDoterRig];
   // NSLog(@"getDoter==%@",getDoter);
    
    NSString * getPerDoterRig  = [NSString stringWithFormat:@"%@",@"<li>[\\s\\S]*?</li>"];
    NSMutableArray * resutlArr=[self getRegexWithString:getPerDoterRig andResource:getDoter];
    
     NSMutableArray * doterArr=[[NSMutableArray alloc] init];
    if(resutlArr)
    {
        
       
        
        NSString * getURLReg  = [NSString stringWithFormat:@"%@",@"href=\"[\\s\\S]*?\""];
        NSString * getNAMEReg  = [NSString stringWithFormat:@"%@",@"title=\"[\\s\\S]*?\""];
        NSString * getDetailurl;
        NSString * getName;
        
        for (NSString * str in  resutlArr)
        {
            Main * mian=[[Main alloc] init];
            
            NSString * temp=[NSString stringWithFormat:@"%@",str];
            
            getDetailurl=[temp stringByMatching:getURLReg];
            
            if(getDetailurl)
            {
                getDetailurl=[getDetailurl substringWithRange:NSMakeRange(6, [getDetailurl length]-1-6)];
                
                getDetailurl=[getDetailurl stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                mian.detailUrl=[NSString stringWithFormat:@"%@%@",BASETWOURL,getDetailurl];
            }
            
            getName=[temp stringByMatching:getNAMEReg];
            
            if(getName)
            {
                
                getName=[getName substringWithRange:NSMakeRange(7, [getName length]-1-7)];
                
                getName=[getName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                mian.name=getName;
            }
            
            
            [doterArr addObject:mian];
            NSLog(@"name-%@",getName);
            NSLog(@"url=%@",getDetailurl);
        }
    
    }
    
    NSDictionary * dic=[NSDictionary dictionaryWithObject:doterArr forKey:@"doterArr"];
    POST_NOTIFICATION(@"DataSource", dic, nil);
    
    
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
    if(!ifOk)
    {
       
        NSString * ifHavePro=@" function checkPro(){ var tags= document.getElementsByClassName('w300 bor525252');  var pro =tags[0];  if(typeof(pro) == 'undefined'){  return false; }else{  return true;  }}";
        [_requestWebView stringByEvaluatingJavaScriptFromString:ifHavePro];
        NSString * ifHasPro= [_requestWebView stringByEvaluatingJavaScriptFromString:@"checkPro();"];
        if([ifHasPro isEqualToString:@"true"])
        {
            
            NSString * js=@"document.documentElement.innerHTML";
            NSString * myhtl= [_requestWebView stringByEvaluatingJavaScriptFromString:js];
           // NSLog(@"html==%@",myhtl);
            [self URLFactory:myhtl];
            ifOk=YES;
           
        }
    }
    
    if(!ifHotOk)
    {
    
        
        NSString * ifHaveHot=@" function checkHotPro(){ var tags= document.getElementsByClassName('slide-cont');  var pro =tags[0];  if(typeof(pro) == 'undefined'){  return false; }else{  return true;  }}";
        
        [_requestWebView stringByEvaluatingJavaScriptFromString:ifHaveHot];
        NSString * ifHasHotPro= [_requestWebView stringByEvaluatingJavaScriptFromString:@"checkHotPro();"];
        
        if([ifHasHotPro isEqualToString:@"true"])
        {
            
            NSString * js=@"document.documentElement.innerHTML";
            NSString * myhtl= [_requestWebView stringByEvaluatingJavaScriptFromString:js];
            // NSLog(@"html==%@",myhtl);
            [self HotURLFactory:myhtl];
            ifHotOk=YES;
        }
    
    }
    
    if(!ifnewOk)
    {
        
        NSString * ifHaveHot=@" function checkHotPro(){ var tags= document.getElementById('divLatestList'); var arr=tags.getElementsByTagName('ul'); if(arr.length>0){  return true; }else{  return false;  }}";
        
        [_requestWebView stringByEvaluatingJavaScriptFromString:ifHaveHot];
        NSString * ifHasnwetPro= [_requestWebView stringByEvaluatingJavaScriptFromString:@"checkHotPro();"];
        
        if([ifHasnwetPro isEqualToString:@"true"])
        {
            
            NSString * js=@"document.documentElement.innerHTML";
            NSString * myhtl= [_requestWebView stringByEvaluatingJavaScriptFromString:js];
             NSLog(@"html==%@",myhtl);
            [self NEWURLFactory:myhtl];
            ifnewOk=YES;
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
   
    NSString * js=@"document.documentElement.innerHTML";
    NSString * myhtl= [_requestWebView stringByEvaluatingJavaScriptFromString:js];
    NSLog(@"html==%@",myhtl);
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
