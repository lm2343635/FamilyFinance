//
//  RecordDao.h
//  FamilyFinance
//
//  Created by limeng on 11/25/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "DaoTemplate.h"

@interface RecordDao : DaoTemplate

- (Record *)saveWithRname:(NSString *)rname
                  andTime:(NSDate *)time
                andAmount:(double)amount
        andClassification:(Classification *)classification
                andAcount:(Account *)account
                  andShop:(Shop *)shop
                  andUser:(User *)user
           andAccountBook:(AccountBook *)accountBook;

- (NSArray *)findByAccoutBook:(AccountBook *)accountBook;

@end
