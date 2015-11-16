//
//  ClassificationDao.h
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "DaoTemplate.h"

@interface ClassificationDao : DaoTemplate

- (Classification *)saveWithCname: (NSString *)cname
                    inAccountBook: (AccountBook *)accountBook;

- (NSArray *) findByAccountBook: (AccountBook *)accountBook;

@end
