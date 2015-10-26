//
//  AccountBook.h
//  FamilyFinance
//
//  Created by 李大爷 on 10/26/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <CouchbaseLite/CouchbaseLite.h>

@class User;

@interface AccountBook : CBLModel

@property (readwrite) NSString *abname;
@property (readwrite) User *owner;
@property (readwrite) NSSet *members;

@end
