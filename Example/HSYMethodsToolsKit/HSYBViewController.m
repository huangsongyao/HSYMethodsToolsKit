//
//  HSYBViewController.m
//  HSYMethodsToolsKit_Example
//
//  Created by anmin on 2019/12/7.
//  Copyright © 2019 317398895@qq.com. All rights reserved.
//

#import "HSYBViewController.h"
#import "UIScrollView+Pages.h"
#import "UIView+Frame.h"
#import "UINavigationBar+NavigationItem.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface HSYBViewController ()

@end

@implementation HSYBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *_scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.backgroundColor = UIColor.whiteColor;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.hidden = YES;
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];
    NSArray *imgs = @[@"open_light_icon", @"open_light_icon", @"open_light_icon", @"open_light_icon", @"open_light_icon"];
    CGFloat x = 0.0f;
    for (NSString *img in imgs) {
        UIImage *image = [UIImage imageNamed:img];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image highlightedImage:image];
        imageView.size = self.view.size;
        imageView.x = x;
        [_scrollView hsy_addSubview:imageView];
        x = imageView.right;
    }
    [_scrollView setContentSize:CGSizeMake(x, 0)];
    
    @weakify(self);
    self.navigationItem.leftBarButtonItems = [UINavigationBar hsy_titleNavigationItems:@[@{@{@(2121) : [UIFont systemFontOfSize:15]} : @{@"list" : UIColor.darkGrayColor}}] leftEdgeInsets:0.0 subscribeNext:^(UIButton * _Nonnull button, NSInteger tag) {
        @strongify(self);
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
