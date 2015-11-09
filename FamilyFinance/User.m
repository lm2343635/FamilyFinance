//
//  User.m
//  FamilyFinance
//
//  Created by 李大爷 on 10/26/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "User.h"

@implementation User

@dynamic uname, email, password, login;

- (void)awakeFromInitializer {
    self.type=kUserDocType;
}

+ (NSArray *)queryUsersInDataBase:(CBLDatabase *)database {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    CBLView *view=[database viewNamed:@"users"];
    if(!view.mapBlock) {
        [view setMapBlock:MAPBLOCK({
            if([doc[@"type"] isEqualToString:kUserDocType])
                emit(doc[@"email"], nil);
        })
              reduceBlock:nil
                  version:@"3"];
    }
    CBLQuery *query=[view createQuery];
    CBLQueryEnumerator *rows=[query run:nil];
    NSMutableArray *users=[[NSMutableArray alloc] init];
    for(CBLQueryRow *row in rows) {
        User *user=[User modelForDocument:row.document];
        [users addObject:user];
    }
    return users;
}
@end
