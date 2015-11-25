//
//  DaoManager.m
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "DaoManager.h"

@implementation DaoManager

- (instancetype)init {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    self=[super init];
    self.userDao=[[UserDao alloc] init];
    self.accountBookDao=[[AccountBookDao alloc] init];
    self.classificationDao=[[ClassificationDao alloc] init];
    self.accountDao=[[AccountDao alloc] init];
    self.shopDao=[[ShopDao alloc] init];
    self.recordDao=[[RecordDao alloc] init];
    return self;
}


@end
