//
//  ZJHManager.h
//  ZJH
//
//  Created by 盖世英雄 on 2017/2/21.
//  Copyright © 2017年 盖世英雄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HandCards.h"

@interface ZJHManager : NSObject

/**
 *比较两个手牌的大小
 *cardsOne:手牌1
 *cardTwo:手牌2
 *返回排序方式
 */
- (NSComparisonResult)compare:(HandCards *)cardsOne cardsTwo:(HandCards *)cardsTwo;

/**
 *比较多副手牌的大小
 *handCardss:多副手牌的数组
 *返回最大手牌（用数组承接）
 */
- (HandCards *)maxHandCards:(NSArray *)handCardss;


@end
