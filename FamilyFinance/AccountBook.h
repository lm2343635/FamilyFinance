//
//  AccountBook.h
//  FamilyFinance
//
//  Created by 李大爷 on 10/26/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <CouchbaseLite/CouchbaseLite.h>

#define kAccountBookDocType @"accountBook"

@class User;

@interface AccountBook : CBLModel

@property (readwrite) NSString *abname;
@property (readwrite) User *owner;

+ (NSArray *)queryAccountBooksInDatabase: (CBLDatabase *)database;

@end
