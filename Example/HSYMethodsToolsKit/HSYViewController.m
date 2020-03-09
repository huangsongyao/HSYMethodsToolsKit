//
//  HSYViewController.m
//  HSYMethodsToolsKit
//
//  Created by 317398895@qq.com on 09/26/2019.
//  Copyright (c) 2019 317398895@qq.com. All rights reserved.
//

#import "HSYViewController.h"
#import "UILabel+SuggestSize.h"
#import "UIView+Frame.h"
#import <JSONModel/JSONModel.h>
#import "NSObject+JSONModel.h"
#import "UIAlertController+RACSignal.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "UIView+Rotated.h"
#import "UIButton+UIKit.h"
#import "HSYBViewController.h"
#import "UIButton+Loading.h"
#import "UIView+Layer.h"
#import "RACSignal+Combined.h"
#import "RACSignal+Convenients.h"
#import "UIImage+MixColors.h"
#import <HSYMacroKit/HSYToolsMacro.h>

@interface testJsonModel : JSONModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *name;

@end

@implementation testJsonModel


@end

@interface HSYViewController ()

@property (nonatomic, assign) BOOL testResult;

@end

@implementation HSYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.testResult = YES;
//    UILabel *label = [[UILabel alloc] init];
//    [label hsy_alineSuggestString:@"为了能够实时的监听textField" maxWidths:300 font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentLeft];
//    [self.view addSubview:label];
//    label.x = 10.0f;
//    label.y = 100.0f;
//    label.backgroundColor = UIColor.greenColor;
    testJsonModel *ts = [NSObject hsy_toJSONModel:@{@"title" : @"123", @"name" : @"wocao"} forModelClasses:[testJsonModel class]];
    NSLog(@"%@", ts);
//    [[UIAlertController hsy_showAlertController:self title:@"title" message:@"message" alertActionTitles:@[@"sure"]] subscribeNext:^(UIAlertAction * _Nullable x) {
//        NSLog(@"%@", x.hsy_actionIndex);
//    }];
//    [[UIAlertController hsy_showSheetController:self title:@"title" message:@"message" sheetActionTitles:@[@"sure"]] subscribeNext:^(UIAlertAction * _Nullable x) {
//        NSLog(@"%@", x.hsy_actionIndex);
//    }];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = UIColor.grayColor;
    [self.view addSubview:view];
    [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
        [view hsy_rotateds];
    }];
    
    @weakify(self);
    UIButton *button = [UIButton hsy_buttonWithAction:^(UIButton * _Nonnull button) {
        NSLog(@"button=>%@", button);
        [button hsy_loadingButton:self.view.backgroundColor forMap:^RACSignal * _Nonnull(BOOL isAnimating) {
            return [RACSignal hsy_signalSubscriber:^(id<RACSubscriber>  _Nonnull subscriber) {
                @strongify(self);
                HSYBViewController *vc = [[HSYBViewController alloc] init];
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
                [self presentViewController:nav animated:YES completion:nil];
                [RACSignal hsy_performSendSignal:subscriber forObject:RACTuplePack(@(self.testResult))];
            } afterDelays:2.0];
        }];
    }];
//    [button hsy_setImage:[UIImage imageNamed:@"open_light_icon"]];
    [button hsy_setTitle:@"测试一下"];
    [button hsy_setTitleColor:UIColor.yellowColor];
    button.backgroundColor = UIColor.redColor;
    button.origin = CGPointMake(100, 300);
//    button.size = CGSizeMake(100.0f, 50.0f);
    button.size = CGSizeMake(50.0f, 150.0f);
    
    [button hsy_setRoundnessCornerRadius];
//    [button hsy_setImagePosition:kHSYMethodsToolsButtonImagePositionRight forSpacing:10.0f];
    [self.view addSubview:button];
    
    [[[RACSignal hsy_zipSignals:@[
        [RACSignal hsy_sendObjectSignal:@"222"],
        [RACSignal hsy_sendObjectSignal:@"555"],
        [RACSignal hsy_sendErrorSignal:[NSError new]],
        [RACSignal hsy_sendObjectSignal:@"777"],
        [RACSignal hsy_sendObjectSignal:@"888" afterDelays:2],
        [RACSignal hsy_sendObjectSignal:@"444" afterDelays:6],
        [RACSignal hsy_sendObjectSignal:@"000"],
        [RACSignal hsy_sendObjectSignal:@"111"],
    ]] deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSArray<RACTuple *> * _Nullable x) {
        
        RACTuple *last = x.lastObject;
        NSLog(@"last.first => %@, last.second => %@, last.third => %@", last.first, last.second, last.third);
    }];
    
    UIImage *image = [UIImage hsy_imageWithMixColors:@[HSY_HEX_COLOR(0xFFCB35), HSY_HEX_COLOR(0xFF6B32)] size:CGSizeMake(100, 100)];
    NSLog(@"%@", image);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
