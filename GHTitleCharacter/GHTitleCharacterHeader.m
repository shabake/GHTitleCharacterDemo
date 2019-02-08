//
//  GHTitleCharacterHeader.m
//  GHTitleCharacterDemo
//
//  Created by zhaozhiwei on 2019/2/8.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHTitleCharacterHeader.h"
#import "NSString+GHAdd.h"
#import "UIView+GHAdd.h"
#import "GHTitleCharacterSearchBar.h"

@interface GHTitleCharacterHeader()
@property (nonatomic , strong) UILabel *title;
@property (nonatomic , strong) UIView *menu;
@property (nonatomic , strong) GHTitleCharacterSearchBar *searchBar;

@end
@implementation GHTitleCharacterHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        [self setupUI];
    }
    return self;
}

- (void)setHeaderHeight:(CGFloat)headerHeight {
    _headerHeight = headerHeight;
    self.gh_height = headerHeight;
    self.searchBar.gh_height = headerHeight - 64 + 20;
//    self.searchBar.alpha = 1 - (headerHeight - 64 + 20)/headerHeight;
    self.menu.gh_top = self.searchBar.gh_height;
}

- (void)setupUI {
    [self addSubview:self.searchBar];
    [self addSubview:self.menu];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (UIView *)menu {
    if (_menu == nil) {
        _menu = [[UIView alloc]initWithFrame:CGRectMake(0, 84,[UIScreen mainScreen].bounds.size.width , 44)];
        _menu.backgroundColor = [UIColor orangeColor];
    }
    return _menu;
}

- (GHTitleCharacterSearchBar *)searchBar {
    if (_searchBar == nil) {
        _searchBar = [[GHTitleCharacterSearchBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 84)];
        _searchBar.backgroundColor = [UIColor blueColor];
    }
    return _searchBar;
}

- (UILabel *)title {
    if (_title == nil) {
        _title = [[UILabel alloc]init];
        _title.text = @"我是一个标题";
        _title.frame = CGRectMake(200, 300, 300, 30);
        _title.textColor = [UIColor whiteColor];
        _title.font = [UIFont systemFontOfSize:30];
    }
    return _title;
}


@end
