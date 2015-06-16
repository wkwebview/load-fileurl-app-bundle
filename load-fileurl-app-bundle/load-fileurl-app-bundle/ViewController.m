//
//  ViewController.m
//  load-fileurl-app-bundle
//
//  Created by wkwebview on 6/16/15.
//  Copyright © 2015 wkwebview. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (self.webView == nil) {
        self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
        self.webView.navigationDelegate = self;
        self.webView.UIDelegate = self;
        [self.view addSubview:self.webView];
    }
    
    NSString* indexFilePath = [self appBundleIndexFile:@"index.html" inFolder:@"www"];
    [self.webView
     loadFileURL:[NSURL fileURLWithPath:indexFilePath]
     allowingReadAccessToURL:[NSURL fileURLWithPath:[indexFilePath stringByDeletingLastPathComponent]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString*) appBundleIndexFile:(NSString*)fileName inFolder:(NSString*)folderName
{
    return [[NSBundle mainBundle] pathForResource:fileName ofType:@"" inDirectory:folderName];
}

#pragma mark WKNavigationDelegate

- (void)webView:(WKWebView*)webView didFailNavigation:(WKNavigation*)navigation withError:(NSError*)error
{
    [self webView:webView didFailProvisionalNavigation:navigation withError:error];
}

- (void)webView:(WKWebView*)webView didFailProvisionalNavigation:(WKNavigation*)navigation
      withError:(NSError*)error
{
    __weak __typeof(self) weakSelf = self;
    
    UIAlertController* alertController = [UIAlertController  alertControllerWithTitle:@"Load Failed"  message:[error localizedDescription]  preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }]];
    [weakSelf presentViewController:alertController animated:YES completion:nil];
}

#pragma mark WKUIDelegate

- (void)webView:(WKWebView*)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo*)frame completionHandler:(void (^)(void))completionHandler
{
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:message
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler();
                                                      }]];
    [self presentViewController:alertController animated:YES completion:^{}];
}

@end
