//
//  UserDao.h
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "DaoTemplate.h"


@interface UserDao : DaoTemplate

- (User *)saveWithEmail:(NSString *)email
               andUname:(NSString *)uname
            andPassword:(NSString *)password;

- (User *)findLogined;

- (User *)findByEmail: (NSString *)email;
@end
