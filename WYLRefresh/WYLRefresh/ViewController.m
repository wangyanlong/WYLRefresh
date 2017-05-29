//
//  ViewController.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/28.
//  Copyright © 2017年 wyl. All rights reserved.
//
#import "RefreshViewController.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *tapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [tapBtn setTitle:@"WYLRefresh" forState:UIControlStateNormal];
    tapBtn.backgroundColor = [UIColor colorWithRed:(arc4random()%255/255.0) green:(arc4random()%255/255.0) blue:(arc4random()%255/255.0) alpha:1];
    tapBtn.frame = CGRectMake(100.f, 100.f, 100.f, 50.f);
    [tapBtn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:tapBtn];
    
}

- (void)btnAction {
    
    RefreshViewController *mainViewCtrl = [[RefreshViewController alloc] init];
    
    [self.navigationController pushViewController:mainViewCtrl animated:YES];
    //    [self presentViewController:mainViewCtrl animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
