//
//  AccountBook.m
//  FamilyFinance
//
//  Created by 李大爷 on 10/26/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "AccountBook.h"

@implementation AccountBook

@dynamic abname, owner;

-(void)awakeFromInitializer {
    self.type=kAccountBookDocType;
}

@end
