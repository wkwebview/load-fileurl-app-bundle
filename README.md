# load-fileurl-app-bundle

iOS 9 test of loading a file url from the app bundle.

[rdar://problem/21409972](rdar://problem/21409972)

This test only fails on an iOS 9 device, it always passes on a Simulator.
This test tries to load web assets from a folder in the app bundle itself.

API tested: [loadFileURL:allowingReadAccessToURL:](https://github.com/WebKit/webkit/blob/f5e93b587422c2471cf2b79944ef6b0c3557a7d5/Source/WebKit2/UIProcess/API/Cocoa/WKWebView.h#L101)


## RADAR FILED

Summary:

When on an iOS 9 device, When including assets in your app bundle, WKWebView cannot load these assets as file URLs using the WKWebView loadFileURL:allowingReadAccessToURL:  API, they won't load.

This works in the Simulator.

Steps to Reproduce:

1. Create a WKWebView
2. Try to load a HTML file that is included in your app bundle

Expected Results:

HTML file that is in your app bundle is loaded

Actual Results:

HTML file that is in your app bundle is not loaded

Version:

iOS 9 (13A4254v)

Notes:

Test app provided to repro: https://github.com/wkwebview/load-fileurl-app-bundle

Configuration:

iPhone 5s GSM 

## EXPECTED

![](results/expected.jpg)


## ACTUAL

![](results/actual.png)