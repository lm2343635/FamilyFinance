//
//  User.m
//  FamilyFinance
//
//  Created by 李大爷 on 10/26/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "User.h"

@implementation User

@dynamic uname, email, password, login, usingAccountBook;

- (void)awakeFromInitializer {
    self.type=kUserDocType;
}

@end
