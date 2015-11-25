//
//  Record.h
//  FamilyFinance
//
//  Created by 李大爷 on 10/26/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <CouchbaseLite/CouchbaseLite.h>

#define kRecordDocType @"record"

@class Classification, Account, Shop, AccountBook, User;
@interface Record : CBLModel

@property (readwrite) NSString *rname;
@property (readwrite) NSNumber *amount;
@property (readwrite) NSDate *time;
@property (readwrite) Classification *classification;
@property (readwrite) Account *account;
@property (readwrite) Shop *shop;
@property (readwrite) AccountBook *accountBook;
@property (readwrite) User *user;

@end
