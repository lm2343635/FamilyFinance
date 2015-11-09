//
//  Record.h
//  FamilyFinance
//
//  Created by 李大爷 on 10/26/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <CouchbaseLite/CouchbaseLite.h>

@interface Record : CBLModel

@property (readwrite) NSString *rname;

@end
