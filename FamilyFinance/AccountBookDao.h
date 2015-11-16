//
//  AccountBookDao.h
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "DaoTemplate.h"


@interface AccountBookDao : DaoTemplate

- (AccountBook *)saveWithAbname: (NSString *)abname
                        forUser: (User *)user;

- (NSArray *)findByUser: (User *)user;


@end
