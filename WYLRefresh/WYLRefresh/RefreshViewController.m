//
//  RefreshViewController.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//
#import "WYLRefreshNormalHeader.h"
#import "WYLRefreshStateHeader.h"
#import "UIScrollView+WYLRefreshCategory.h"
#import "RefreshViewController.h"
#import "WYLRefreshGifHeader.h"
#import "WYLRefreshBackFooter.h"
#import "WYLRefreshAutoStateFooter.h"
#import "WYLRefreshStateBackFooter.h"
#define WeakObj(o) try{}@finally{} __weak typeof(o) o##Weak = o;

@interface RefreshViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

static int num = 20;

@implementation RefreshViewController

- (void)dealloc
{
    [self.tableView.wylFooter removeFromSuperview];
    [self.tableView.wylHeader removeFromSuperview];
    NSLog(@"1234");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    @WeakObj(self)
    
    WYLRefreshStateHeader *header = [WYLRefreshStateHeader headerWithRefreshingBlock:^{
        
        NSLog(@"header refreshing");
        
    }];
    
    self.tableView.wylHeader = header;
    
    self.tableView.wylFooter = [WYLRefreshStateBackFooter footerWithRefreshBlock:^{
        
        NSLog(@"footer refreshing");
//        num += 10;
//        sleep(2);
//        [selfWeak.tableView reloadData];
//        [selfWeak.tableView.wylFooter endRefresh];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView delegate && datasource method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"wyl";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"WYLRefresh";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    [self.tableView.eocFooter endRefresh];
    [self.tableView.wylHeader endRefresh];
    
}


#pragma mark - 懒加载
- (UITableView *)tableView{
    
    if (!_tableView){
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor lightGrayColor];

    }
    
    return _tableView;
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
