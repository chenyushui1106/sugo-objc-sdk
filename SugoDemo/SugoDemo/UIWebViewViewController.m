//
//  UIWebViewViewController.m
//  SugoDemo
//
//  Created by Zack on 20/3/17.
//  Copyright © 2017年 sugo. All rights reserved.
//

#import "UIWebViewViewController.h"
@import Sugo;

@interface UIWebViewViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation UIWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.self.webView.delegate = self;
    
    self.webView.delegate = self;
    NSURL *url = [[NSURL alloc] initWithString:@"https://jd.com/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
