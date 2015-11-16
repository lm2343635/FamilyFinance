//
//  AccountDao.m
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "AccountDao.h"

@implementation AccountDao

- (Account *)saveWithAname:(NSString *)aname
            andAccountBook:(AccountBook *)accountBook {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    Account *account=[Account modelForNewDocumentInDatabase:self.database];
    account.aname=aname;
    account.ain=[NSNumber numberWithDouble:0.0];
    account.aout=[NSNumber numberWithDouble:0.0];
    account.accountBook=accountBook;
    NSError *error;
    if(![account save:&error]) {
        NSLog(@"Error: %@", error.localizedDescription);
    }
    return account;
}

- (NSArray *)findByAccountBook:(AccountBook *)accountBook {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    CBLView *view=[self.database viewNamed:@"accountsByAccountBook"];
    [view setMapBlock:^(CBLJSONDict * _Nonnull doc, CBLMapEmitBlock  _Nonnull emit) {
        if([doc[@"type"] isEqualToString:kAccountDocType]
           &&[doc[@"accountBook"] isEqualToString:[accountBook.document.properties objectForKey:@"_id"]]) {
            emit(doc[@"aname"], nil);
        }
    }
              version:@"1"];
    return [self arrayFromView:view];
}
@end
