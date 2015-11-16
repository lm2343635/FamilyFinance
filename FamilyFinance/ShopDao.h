//
//  ShopDao.h
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "DaoTemplate.h"

@interface ShopDao : DaoTemplate

- (Shop *)saveWithSname: (NSString *)sname
         andAccountBook: (AccountBook *)accountBook;

- (NSArray *)findByAccountBook: (AccountBook *)accountBook;

@end
