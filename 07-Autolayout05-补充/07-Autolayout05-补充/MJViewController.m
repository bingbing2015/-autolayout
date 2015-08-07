//
//  MJViewController.m
//  07-Autolayout05-补充
//
//  Created by apple on 14-5-31.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.leftMargin.constant = 100;
    self.width.constant = 200;
    
    [UIView animateWithDuration:2.0 animations:^{
        [self.view layoutIfNeeded];
        [self.redView layoutIfNeeded];
    }];
    
    self.textLabel.text = @"sdhjkfhkjlsdhkjflhjdsflhjsdlhkjflhjdshjlfsdhjkfhkjlsdhkjflhjdsflhjsdlhkjflhjdshjlfsdhjkfhkjlsdhkjflhjdsflhjsdlhkjflhjdshjlfsdhjkfhkjlsdhkjflhjdsflhjsdlhkjflhjdshjlfsdhjkfhkjlsdhkjflhjdsflhjsdlhkjflhjdshjlf";
}
@end
