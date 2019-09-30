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

@interface testJsonModel : JSONModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *name;

@end

@implementation testJsonModel


@end

@interface HSYViewController ()

@end

@implementation HSYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    [label hsy_alineSuggestString:@"为了能够实时的监听textField" maxWidths:300 font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentLeft];
    [self.view addSubview:label];
    label.x = 10.0f;
    label.y = 100.0f;
    label.backgroundColor = UIColor.greenColor;
    testJsonModel *ts = [NSObject hsy_toJSONModel:@{@"title" : @"123", @"name" : @"wocao"} forModelClasses:[testJsonModel class]];
    NSLog(@"%@", ts);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
