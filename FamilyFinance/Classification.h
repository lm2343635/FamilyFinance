//
//  Classification.h
//  FamilyFinance
//
//  Created by 李大爷 on 11/1/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <CouchbaseLite/CouchbaseLite.h>

#define kClassificationDocType @"classification"

@class AccountBook;
@interface Classification : CBLModel

@property (readwrite) NSString *cname;
@property (readwrite) NSNumber *cin;
@property (readwrite) NSNumber *cout;
@property (readwrite) AccountBook *accountBook;

@end
