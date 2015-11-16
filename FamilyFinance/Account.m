//
//  Account.m
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "Account.h"

@implementation Account

@dynamic aname, ain, aout, accountBook;

- (void)awakeFromInitializer {
    self.type=kAccountDocType;
}

@end
