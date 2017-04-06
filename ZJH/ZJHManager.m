//
//  ZJHManager.m
//  ZJH
//
//  Created by 盖世英雄 on 2017/2/21.
//  Copyright © 2017年 盖世英雄. All rights reserved.
//

#import "ZJHManager.h"

@implementation ZJHManager

/**
 *比较两个手牌的大小
 *cardsOne:手牌1
 *cardTwo:手牌2
 *返回排序方式
 */
- (NSComparisonResult)compare:(HandCards *)cardsOne cardsTwo:(HandCards *)cardsTwo {
    if (cardsOne.cardType < cardsTwo.cardType) {
        if (cardsOne.cardType == BaoZi && cardsTwo.cardType == TeShu) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    } else if (cardsOne.cardType > cardsTwo.cardType) {
        if (cardsOne.cardType == TeShu && cardsTwo.cardType == BaoZi) {
            return NSOrderedDescending;
        } else {
            return NSOrderedAscending;
        }
    } else {
        //比较最大的牌
        Card *maxCardOne = cardsOne.cards[2];
        Card *maxCardTwo = cardsTwo.cards[2];
        if (maxCardOne.count > maxCardTwo.count) {
            return NSOrderedDescending;
        } else if (maxCardOne.count < maxCardTwo.count) {
            return NSOrderedAscending;
        } else {
            //最大的牌相同比较第二大的牌
            Card *secCardOne = cardsOne.cards[1];
            Card *secCardTwo = cardsTwo.cards[1];
            if (secCardOne.count > secCardTwo.count) {
                return NSOrderedDescending;
            } else if (secCardOne.count < secCardTwo.count) {
                return NSOrderedAscending;
            } else {
                //比较第三大的牌
                Card *thrCardOne = cardsOne.cards[0];
                Card *thrCardTwo = cardsTwo.cards[0];
                if (thrCardOne.count > thrCardTwo.count) {
                    return NSOrderedDescending;
                } else if (thrCardOne.count < thrCardTwo.count) {
                    return NSOrderedAscending;
                } else {
                    return NSOrderedSame;
                }
            }
        }
    }
}

/**
 *比较多副手牌的大小
 *handCardss:多副手牌的数组
 *返回最大手牌（用数组承接）
 */
- (NSArray<HandCards *> *)maxHandCards:(NSArray *)handCardss {
    //根据cardType对手牌排序
    NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc] initWithKey:@"cardType" ascending:YES];
    NSArray *sortArr = [handCardss sortedArrayUsingDescriptors:@[sortDesc]];
    //查看是否存在豹子
    HandCards *maxHandCard = sortArr.firstObject;
    if (maxHandCard.cardType == BaoZi) {
        //遍历剩余的手牌，查看是否存在特殊的手牌
        NSMutableArray *mATmp = [NSMutableArray array];
        for (HandCards *handCard in handCardss) {
            if (handCard.cardType == TeShu) {
                [mATmp addObject:handCard];
            }
        }
        if (mATmp.count > 0) {
            return mATmp;
        } else {
            return @[maxHandCard];
        }
    } else {
        //检查是否存在相同的最大牌
        NSMutableArray *sameHandCards = [NSMutableArray array];
        [sameHandCards addObject:maxHandCard];
        for (int i = 1; i < handCardss.count; i++) {
            HandCards *handCards = handCardss[i];
            NSComparisonResult result = [self compare:maxHandCard cardsTwo:handCards];
            if (result == NSOrderedSame) {
                [sameHandCards addObject:handCards];
            }
        }
        return sameHandCards;
    }
}

@end
