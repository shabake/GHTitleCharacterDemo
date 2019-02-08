//
//  NSString+GHAdd.m
//  GHKit
//
//  Created by zhaozhiwei on 2019/2/8.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "NSString+GHAdd.h"

@implementation NSString (GHAdd)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}
@end
