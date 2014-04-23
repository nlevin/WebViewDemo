//
//  WVDemoViewController.m
//  WebViewDemo
//
//  Created by Nirav Savjani and Noah Levin on 10/28/13.
//  Copyright (c) 2013 Nirav Savjani and Noah Levin. All rights reserved.
//

#import "WVDemoViewController.h"

@interface WVDemoViewController ()

@property (nonatomic, strong) NSString *initialURL;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation WVDemoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
	self.initialURL = @"http://nlevin.com/framer.html"; // I recommend defaulting to your local prototype path
  
  self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
  self.webView.scalesPageToFit = YES;
  self.webView.scrollView.bounces = NO;
  self.webView.contentMode = UIViewContentModeScaleToFill;
  self.webView.multipleTouchEnabled = YES;
  self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:self.webView];
  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.initialURL]]];

}

- (BOOL)prefersStatusBarHidden {
  return YES;
}
 
#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
  UITextField *urlField = [alertView textFieldAtIndex:0];
  NSString *URL = urlField.text;
  if (buttonIndex == 1) {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URL]]];
  }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.type == UIEventSubtypeMotionShake) {
        NSString *other1 = @"Refresh";
        NSString *other2 = @"Change URL";
        NSString *other3 = @"Back";
        // NSString *other4 = @"Switch Gesture";
        NSString *cancelTitle = @"Cancel";
        UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:nil
                                      delegate:self
                                      cancelButtonTitle:cancelTitle
                                      destructiveButtonTitle:nil
                                      otherButtonTitles:other1, other2, other3, nil];
        [actionSheet showInView:self.view];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [actionSheet buttonTitleAtIndex:buttonIndex];
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"Change URL"]) {
        UIAlertView *alertView = [[UIAlertView alloc] init];
        alertView.delegate = self;
        alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
        alertView.title = @"Enter a URL";
        [alertView addButtonWithTitle:@"Cancel"];
        [alertView addButtonWithTitle:@"OK"];
        
        UITextField *urlField = [alertView textFieldAtIndex:0];
        urlField.text = @"http://";
        urlField.keyboardType = UIKeyboardTypeURL;
        [alertView show];
    }
    if ([buttonTitle isEqualToString:@"Refresh"]) {
        [self.webView reload];
    }
    if ([buttonTitle isEqualToString:@"Back"]) {
        [self.webView goBack];
    }
    
// TO-DO: Possibly allow people to change the menu gesture so as to not conflict with possible prototype gestures…
//
//    if ([buttonTitle isEqualToString:@"Switch Gesture"]) {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Change Gesture"
//                                                          message:@"Choose how you'd like to access the settings menu so it doesn't conflict with prototype gestures."
//                                                         delegate:self
//                                                cancelButtonTitle:@"Cancel"
//                                                otherButtonTitles:@"Shake", @"Pinch", nil];
//        [alertView show];
//    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Shake"])
    {
        NSLog(@"Shake was selected.");
    }
    else if([title isEqualToString:@"Pinch"])
    {
        NSLog(@"Pinch was selected.");
    }
}


@end
