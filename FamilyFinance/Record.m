//
//  Record.m
//  FamilyFinance
//
//  Created by 李大爷 on 10/26/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "Record.h"

@implementation Record

@dynamic rname, time, amount, classification, account, shop, user, accountBook;

- (void)awakeFromInitializer {
    self.type=kRecordDocType;
}

@end
