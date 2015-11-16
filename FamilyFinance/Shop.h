//
//  Shop.h
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <CouchbaseLite/CouchbaseLite.h>

#define kShopDocType @"shop"

@class AccountBook;
@interface Shop : CBLModel

@property (readwrite) NSString *sname;
@property (readwrite) NSNumber *sin;
@property (readwrite) NSNumber *sout;
@property (readwrite) AccountBook *accountBook;

@end
