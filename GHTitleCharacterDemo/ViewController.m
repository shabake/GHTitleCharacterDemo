//
//  ViewController.m
//  GHTitleCharacterDemo
//
//  Created by zhaozhiwei on 2019/2/8.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "ViewController.h"
#import "GHTitleCharacterHeader.h"
#define kHeaderHeight 130

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) GHTitleCharacterHeader *header;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    self.header.headerHeight = kHeaderHeight;

}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)setupUI {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.header];
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
}
- (void)loadData {
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]){
        UITableView *tableView = object;
        CGFloat contentOffsetY = tableView.contentOffset.y;
        if (-contentOffsetY >= kHeaderHeight) {
            [UIView animateWithDuration:0.25 animations:^{
                self.header.headerHeight = kHeaderHeight;
            }];
        } else {
            [UIView animateWithDuration:0.25 animations:^{
                self.header.headerHeight = 64;
            }];
        }
    }
}


- (void)dealloc {
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    return cell;
}

- (GHTitleCharacterHeader *)header {
    if (_header == nil) {
        _header = [[GHTitleCharacterHeader alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kHeaderHeight - 64)];
    }
    return _header;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCellID"];
        _tableView.contentInset = UIEdgeInsetsMake(kHeaderHeight, 0, 0, 0);
    }
    return _tableView;
}


@end
