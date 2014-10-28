//
//  PlayViewController.m
//  koreaTV
//
//  Created by jin chunhao on 14-2-4.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import "PlayViewController.h"



@implementation PlayViewController

@synthesize webview=_webview;

CGRect  lastrect;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterFullScreen:) name:@"UIMoviePlayerControllerDidEnterFullscreenNotification"object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exitFullScreen:) name:@"UIMoviePlayerControllerDidExitFullscreenNotification"object:nil];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _webview=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
    [_webview setBackgroundColor:[UIColor orangeColor]];
    _webview.delegate=self;
    [_webview sizeToFit];
    _webview.scalesPageToFit=YES;
    _webview.scrollView.scrollEnabled=NO;
    _webview.mediaPlaybackRequiresUserAction = YES;
    //_webview.allowsInlineMediaPlayback = YES;

    
    [self.view addSubview:_webview];
        //[self.view addSubview:_sohuBtn];
    
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
   }
- (void)enterFullScreen:(NSNotification *)notification
{
    
       [self setwebview];
}
-(void) setwebview
{
    //[_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    NSURLCache * cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    [cache setDiskCapacity:0];
    [cache setMemoryCapacity:0];

}
- (void)exitFullScreen:(NSNotification *)notification
{
    [_webview  stopLoading];
    [self setwebview];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


-(void) gotoPlay:(NSString *) playUrl
{
    
        if(playUrl && ![playUrl isEqualToString:@"(null)"])
     {
        //NSString * width=[NSString stringWithFormat:@"100%%"];
        NSLog(@"playURl===%@",playUrl);
        //[self setwebview];
    
         [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:playUrl]]];
                //animations
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//ios5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    
    return UIInterfaceOrientationMaskPortrait;
    
}
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    
    return UIInterfaceOrientationMaskPortrait;
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duratio{
    
    
    
}

@end
