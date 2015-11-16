//
//  AccountBookDao.m
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "AccountBookDao.h"

@implementation AccountBookDao

- (AccountBook *)saveWithAbname:(NSString *)abname
                        forUser:(User *)user {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    AccountBook *accountBook=[AccountBook modelForNewDocumentInDatabase:self.database];
    accountBook.abname=abname;
    accountBook.owner=user;
    NSError *error;
    if(![accountBook save:&error]) {
        NSLog(@"Error: %@", error.localizedDescription);
    }
    return accountBook;
}

- (NSArray *)findByUser:(User *)user {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    CBLView *view=[self.database viewNamed:@"accountBooksByUser"];
    if(!view.mapBlock) {
        [view setMapBlock:MAPBLOCK({
            if([doc[@"type"] isEqualToString:kAccountBookDocType]
               &&[doc[@"owner"] isEqualToString:[user.document.properties objectForKey:@"_id"]]) {
                emit(doc[@"abname"], nil);
            }
        })
                  version:@"1"];
    }
    return [self arrayFromView:view];
}

@end
