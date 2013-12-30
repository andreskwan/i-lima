#import "CSWebVC.h"

@implementation CSWebVC

- (id)init
{
    self = [super init];
    if(self) {
        self.title = @"Taund.com";
    }
    return self;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] init];
    
    self.webView = [[UIWebView alloc] init];
    self.webView.scalesPageToFit = YES;
    [view addSubview:self.webView];
    
    self.view = view;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.taund.com/welcome"]]];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.webView.frame = self.view.frame;
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    self.webView.scrollView.contentInset = UIEdgeInsetsMake(self.topLayoutGuide.length, 0, self.bottomLayoutGuide.length, 0);
}

@end
