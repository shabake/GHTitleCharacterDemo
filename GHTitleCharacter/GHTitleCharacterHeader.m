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
#import "GHTitleCharacterMenu.h"

@interface GHTitleCharacterHeader()
@property (nonatomic , strong) UILabel *title;
@property (nonatomic , strong) GHTitleCharacterMenu *menu;
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
    self.searchBar.gh_top = headerHeight - 64- 20 - 20;
    self.searchBar.gh_height = headerHeight - 64;
    self.searchBar.space = headerHeight;
    self.menu.gh_top = headerHeight - 64 + 20;
}

- (void)setupUI {
    [self addSubview:self.searchBar];
    [self addSubview:self.menu];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (GHTitleCharacterMenu *)menu {
    if (_menu == nil) {
        _menu = [[GHTitleCharacterMenu alloc]initWithFrame:CGRectMake(20, 84,[UIScreen mainScreen].bounds.size.width - 40 , 44)];
        _menu.backgroundColor = [UIColor orangeColor];
    }
    return _menu;
}

- (GHTitleCharacterSearchBar *)searchBar {
    if (_searchBar == nil) {
        _searchBar = [[GHTitleCharacterSearchBar alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 84)];
        _searchBar.backgroundColor = [UIColor orangeColor];
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
