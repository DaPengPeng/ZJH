//
//  Card.h
//  ZJH
//
//  Created by 盖世英雄 on 2017/2/21.
//  Copyright © 2017年 盖世英雄. All rights reserved.
//

#import <Foundation/Foundation.h>

//牌的花色
typedef NS_ENUM(NSInteger, CardColorType) {
    //以下是枚举成员
    Diamond, //方块
    Club, //梅花
    Heart, //红桃
    Spade //黑桃
};

@interface Card : NSObject

@property (nonatomic, assign) NSInteger count; //点数

@property (nonatomic, assign) CardColorType cardColorType; //花色

- (instancetype)initWithCount:(NSInteger)count cardType:(CardColorType)cardColorType;

@end
