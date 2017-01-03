//
//  WebViewBindings.m
//  Sugo
//
//  Created by Zack on 1/12/16.
//  Copyright © 2016年 Sugo. All rights reserved.
//

#import "WebViewBindings.h"
#import "WebViewBindings+WebView.h"
#import "WebViewBindings+UIWebView.h"
#import "WebViewBindings+WKWebView.h"

@interface WebViewBindings ()

@end

@implementation WebViewBindings

+ (instancetype)globalBindings
{
    static WebViewBindings *singleton = nil;
    if (!singleton) {
        singleton = [[self alloc] initSingleton];
    }
    return singleton;
}

- (instancetype)initSingleton
{
    _mode = Designer;
    _codelessBindings = [[NSMutableArray alloc] init];
    _designerBindings = [[NSMutableArray alloc] init];
    _bindings = [[NSMutableArray alloc] init];
    _stringBindings = [[NSMutableString alloc] init];
    self  = [super init];
    
    _uiVcPath = [[NSMutableString alloc] init];
    _wkVcPath = [[NSMutableString alloc] init];
    _isWebViewNeedReload = NO;
    _viewSwizzleRunning = NO;
    
    _uiDidMoveToWindowBlockName = [[NSUUID UUID] UUIDString];
    _uiRemoveFromSuperviewBlockName = [[NSUUID UUID] UUIDString];
    
    _wkDidMoveToWindowBlockName = [[NSUUID UUID] UUIDString];
    _wkRemoveFromSuperviewBlockName = [[NSUUID UUID] UUIDString];
    [self addObserver:self
           forKeyPath:@"stringBindings"
              options:NSKeyValueObservingOptionNew
              context:nil];
    [self addObserver:self
           forKeyPath:@"isWebViewNeedReload"
              options:NSKeyValueObservingOptionNew
              context:nil];
    
    return self;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"WebViewBindings init exception"
                                   reason:@"this is a singleton, try [WebViewBindings globalBindings]"
                                 userInfo:nil];
    return nil;
}

- (void)dealloc
{
    _mode = Designer;
    [_designerBindings removeAllObjects];
    [_codelessBindings removeAllObjects];
    [_bindings removeAllObjects];
    _stringBindings = nil;
    _isWebViewNeedReload = NO;
    
    _uiWebView = nil;
    _uiVcPath = nil;
    
    _wkWebView = nil;
    _wkVcPath = nil;
}

- (void)fillBindings
{
    if (self.mode == Designer)
    {
        self.bindings = _designerBindings;
    } else if (_mode == Codeless)
    {
        self.bindings = _codelessBindings;
    }
    
    if (self.bindings && [self.bindings count] > 0) {
        NSData *jsonBindings = [NSJSONSerialization dataWithJSONObject:self.bindings
                                                               options:NSJSONWritingPrettyPrinted
                                                                 error:nil];
        self.stringBindings = [[NSMutableString alloc] initWithData:jsonBindings
                                                           encoding:NSUTF8StringEncoding];
        
    }
    
}

@end
