//
//  HandCards.m
//  ZJH
//
//  Created by 盖世英雄 on 2017/2/21.
//  Copyright © 2017年 盖世英雄. All rights reserved.
//

#import "HandCards.h"

@implementation HandCards

- (instancetype)initWithCards:(NSArray *)cards {
    if (self = [super init]) {
        //对牌进行排序
        NSSortDescriptor *sortdesc = [[NSSortDescriptor alloc] initWithKey:@"count" ascending:YES];
        self.cards = [cards sortedArrayUsingDescriptors:@[sortdesc]];
        [self analyseCardType:self.cards];
    }
    return self;
}

/**
 *分析牌的类型
 *cards:牌
 *对自己的属性进行更改
 */
- (void)analyseCardType:(NSArray *)cards {
    //是否为清一色
    Card *cardOne = cards[0];
    Card *cardTwo = cards[1];
    Card *cardThr = cards[2];
    NSLog(@"%ld:%ld, %ld:%ld, %ld:%ld", cardOne.count, cardOne.cardColorType, cardTwo.count, cardTwo.cardColorType, cardThr.count, cardThr.cardColorType);
    if (cardOne.cardColorType == cardTwo.cardColorType && cardOne.cardColorType == cardThr.cardColorType) {
        //是否为顺金
        if (cardOne.count + 1 == cardTwo.count && cardTwo.count + 1 == cardThr.count) {
            self.cardType = ShunJin;
        } else {
            //金花
            self.cardType = JinHua;
        }
    } else {
        //豹子
        if (cardOne.count == cardTwo.count && cardTwo.count == cardThr.count) {
            self.cardType = BaoZi;
        } else {
            //对子
            if (cardOne.count == cardTwo.count || cardTwo.count == cardThr.count) {
                self.cardType = DuiZi;
            } else {
                //顺子
                if (cardOne.count + 1 == cardTwo.count && cardTwo.count + 1 == cardThr.count) {
                    self.cardType = ShunZi;
                } else {
                    //特殊
                    if (cardOne.cardColorType != cardTwo.cardColorType && cardOne.cardColorType != cardThr.cardColorType && cardTwo.cardColorType != cardThr.cardColorType) {
                        if (cardOne.count == 2 && cardTwo.count == 5 && cardThr.count == 8) {
                            self.cardType = TeShu;
                        } else {
                            self.cardType = SanPai;
                        }
                    } else {
                        self.cardType = SanPai;
                    }
                }
            }
        }
    }
}


@end
