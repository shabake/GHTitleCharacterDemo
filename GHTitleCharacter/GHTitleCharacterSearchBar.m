//
//  GHTitleCharacterSearchBar.m
//  GHTitleCharacterDemo
//
//  Created by zhaozhiwei on 2019/2/8.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHTitleCharacterSearchBar.h"

@interface GHTitleCharacterSearchBar()
@property (nonatomic , strong) UIImageView *icon;
@property (nonatomic , strong) UITextField *textField ;
@property (nonatomic , strong) UIImageView *history;

@end
@implementation GHTitleCharacterSearchBar

- (void)setSpace:(CGFloat)space {
    _space = space;
    self.alpha = (space - 56)/56;
    self.icon.alpha = self.alpha;
    self.textField.alpha = self.alpha;
    self.history.alpha = self.alpha;

}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.icon];
    [self addSubview:self.textField];
    [self addSubview:self.history];
}

- (UIImageView *)history {
    if (_history == nil) {
        _history = [[UIImageView alloc]init];
        _history.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 30 - 20, self.icon.frame.origin.y, 30, 30);
        _history.backgroundColor = [UIColor whiteColor];
        _history.layer.masksToBounds = YES;
        _history.layer.cornerRadius = 15;
    }
    return _history;
}

- (UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc]init];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.placeholder = @"输入内容";
        _textField.font = [UIFont systemFontOfSize:13];
        _textField.frame = CGRectMake(CGRectGetMaxX(self.icon.frame) + 20, self.icon.frame.origin.y, [UIScreen mainScreen].bounds.size.width - (CGRectGetMaxX(self.icon.frame) + 20) - 70, 30);
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius = 15;
    }
    return _textField;
}

- (UIImageView *)icon {
    if (_icon == nil) {
        _icon = [[UIImageView alloc]init];
        _icon.frame = CGRectMake(20, 20, 30, 30);
        _icon.backgroundColor = [UIColor whiteColor];
        _icon.layer.masksToBounds = YES;
        _icon.layer.cornerRadius = 15;
    }
    return _icon;
}
@end
