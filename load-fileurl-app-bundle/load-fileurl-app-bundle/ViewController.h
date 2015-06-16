//
//  ViewController.h
//  load-fileurl-app-bundle
//
//  Created by wkwebview on 6/16/15.
//  Copyright © 2015 wkwebview. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController < WKNavigationDelegate, WKUIDelegate >

@property (nonatomic, strong) WKWebView* webView;

@end

