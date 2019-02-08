//
//  GHTitleCharacterMenu.m
//  GHTitleCharacterDemo
//
//  Created by zhaozhiwei on 2019/2/8.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHTitleCharacterMenu.h"

@interface GHTitleCharacterMenu()
@property (nonatomic , strong) NSMutableArray *labels;
@end
@implementation GHTitleCharacterMenu

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    for (NSInteger index = 0; index < 4; index++) {
        UILabel *label = [[UILabel alloc]init];
        label.text = [NSString stringWithFormat:@"第%ld个",(long)index];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        [self.labels addObject:label];
        [self addSubview:label];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat y = 0;
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - 3 * 10) /  self.labels.count;

    CGFloat h = self.frame.size.height;
    for (NSInteger index = 0; index < self.labels.count; index++) {
        UILabel *label = self.labels [index];

        label.frame = CGRectMake(index * w ,y, w, h);
    }
}


- (NSMutableArray *)labels {
    if (_labels == nil) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}
@end
