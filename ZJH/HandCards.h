//
//  HandCards.h
//  ZJH
//
//  Created by 盖世英雄 on 2017/2/21.
//  Copyright © 2017年 盖世英雄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

//牌的类型
typedef NS_ENUM(NSInteger, CardType) {
    //以下是枚举成员
    BaoZi, //豹子
    ShunJin, //顺金
    JinHua, //金花
    ShunZi, //顺子
    DuiZi, //对子
    SanPai, //散牌
    TeShu //特殊
};

@interface HandCards : NSObject

@property (nonatomic, strong) NSArray *cards; //牌

@property (nonatomic, assign) CardType cardType; //牌的类型

- (instancetype)initWithCards:(NSArray *)cards;

@end
