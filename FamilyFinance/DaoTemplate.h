//
//  DaoHelper.h
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CouchbaseLite/CouchbaseLite.h>
#import "AppDelegate.h"
#import "User.h"
#import "AccountBook.h"
#import "Classification.h"
#import "Account.h"
#import "Shop.h"
#import "Record.h"

@interface DaoTemplate : NSObject

@property (readwrite) AppDelegate *delegate;
@property (readwrite) CBLDatabase *database;

- (NSArray *)arrayFromView: (CBLView *)view;

- (CBLModel *)modelFromView: (CBLView *)view;

@end
