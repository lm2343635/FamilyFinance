//
//  DaoManager.h
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDao.h"
#import "AccountBookDao.h"
#import "ClassificationDao.h"
#import "AccountDao.h"
#import "ShopDao.h"
#import "RecordDao.h"

@interface DaoManager : NSObject

@property (strong, nonatomic) UserDao *userDao;
@property (strong, nonatomic) AccountBookDao *accountBookDao;
@property (strong, nonatomic) ClassificationDao *classificationDao;
@property (strong, nonatomic) AccountDao *accountDao;
@property (strong, nonatomic) ShopDao *shopDao;
@property (strong, nonatomic) RecordDao *recordDao;


@end
