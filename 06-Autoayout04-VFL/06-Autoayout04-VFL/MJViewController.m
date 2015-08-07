//
//  MJViewController.m
//  06-Autoayout04-VFL
//
//  Created by apple on 14-5-31.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.添加控件
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    // 2.VFL生成约束
    NSDictionary *mertrics = @{@"margin" : @20}; // 参数\数值
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView, redView);
    NSArray *conts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[blueView]-margin-[redView(==blueView)]-margin-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:mertrics views:views];
    
    NSArray *conts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[blueView(==blueHeight)]-margin-|" options:0 metrics:@{@"blueHeight" : @40, @"margin" : @20} views:views];
    [self.view addConstraints:conts];
    [self.view addConstraints:conts2];
}

- (void)test1
{
    // 1.添加控件
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    // 2.VFL生成约束
    NSArray *conts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[blueView]-20-|" options:0 metrics:nil views:@{@"blueView" : blueView}];
    [self.view addConstraints:conts];
    
    NSArray *conts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[blueView(40)]-20-[redView(==blueView)]" options:NSLayoutFormatAlignAllRight metrics:nil views:@{@"blueView" : blueView, @"redView" : redView}];
    [self.view addConstraints:conts2];
    
    NSLayoutConstraint *redWidth = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0];
    [self.view addConstraint:redWidth];
}

@end
