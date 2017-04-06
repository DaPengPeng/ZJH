//
//  ViewController.m
//  ZJH
//
//  Created by 盖世英雄 on 2017/2/21.
//  Copyright © 2017年 盖世英雄. All rights reserved.
//

#import "ViewController.h"
#import "ZJHManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int i = 0; i < 5; i++) {
        NSMutableArray *mArrOne = [NSMutableArray arrayWithCapacity:3];
        for (int i = 0; i < 3; i++) {
            Card *card = [[Card alloc] initWithCount:arc4random_uniform(13)+2 cardType:arc4random_uniform(3)];
            [mArrOne addObject:card];
        }
        HandCards *handCardsOne = [[HandCards alloc] initWithCards:mArrOne];
        
        NSMutableArray *mArrTwo = [NSMutableArray arrayWithCapacity:3];
        for (int i = 0; i < 3; i++) {
            Card *card = [[Card alloc] initWithCount:arc4random_uniform(13)+2 cardType:arc4random_uniform(3)];
            [mArrTwo addObject:card];
        }
        HandCards *handCardsTwo = [[HandCards alloc] initWithCards:mArrTwo];
        
        ZJHManager *manager = [[ZJHManager alloc] init];
        NSComparisonResult result = [manager compare:handCardsOne cardsTwo:handCardsTwo];
        NSLog(@"result = %ld", result);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
