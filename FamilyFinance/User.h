//
//  User.h
//  FamilyFinance
//
//  Created by 李大爷 on 10/26/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <CouchbaseLite/CouchbaseLite.h>

@interface User : CBLModel

@property (readwrite) NSString *email;
@property (readwrite) NSString *password;
@property (readwrite) NSString *uname;
@property (readwrite) NSSet *accountBooks;

@end