//
//  Player.h
//  ZJH
//
//  Created by 盖世英雄 on 2017/2/27.
//  Copyright © 2017年 盖世英雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HandCards;

@interface Player : NSObject

///玩家名字
@property (nonatomic, copy) NSString *name;

///玩家Id
@property (nonatomic, copy) NSString *userId;

///玩家金币
@property (nonatomic, assign) NSInteger money;

///玩家手牌
@property (nonatomic, strong) HandCards *handCards;



@end
