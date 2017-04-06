//
//  Card.m
//  ZJH
//
//  Created by 盖世英雄 on 2017/2/21.
//  Copyright © 2017年 盖世英雄. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype)initWithCount:(NSInteger)count cardType:(CardColorType)cardColorType {
    if (self = [super init]) {
        self.count = count;
        self.cardColorType = cardColorType;
    }
    return self;
}

@end
