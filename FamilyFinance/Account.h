//
//  Account.h
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <CouchbaseLite/CouchbaseLite.h>

#define kAccountDocType @"account"

@class AccountBook;
@interface Account : CBLModel

@property (readwrite) NSString *aname;
@property (readwrite) NSNumber *ain;
@property (readwrite) NSNumber *aout;
@property (readwrite) AccountBook *accountBook;

@end
