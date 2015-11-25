//
//  RecordDao.m
//  FamilyFinance
//
//  Created by limeng on 11/25/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "RecordDao.h"

@implementation RecordDao

- (Record *)saveWithRname: (NSString *)rname
                  andTime: (NSDate *)time
                andAmount: (double)amount
        andClassification: (Classification *)classification
                andAcount: (Account *)account
                  andShop: (Shop *)shop
                  andUser: (User *)user
           andAccountBook: (AccountBook *)accountBook {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    Record *record=[Record modelForNewDocumentInDatabase:self.database];
    record.rname=rname;
    record.time=time;
    record.amount=[NSNumber numberWithDouble:amount];
    record.classification=classification;
    record.account=account;
    record.shop=shop;
    record.user=user;
    record.accountBook=accountBook;
    NSError *error;
    if(![record save:&error]) {
        NSLog(@"Error: %@", error.localizedDescription);
    }
    return record;
}

- (NSArray *)findByAccoutBook:(AccountBook *)accountBook {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    CBLView *view=[self.database viewNamed:@"recordsByAccountBook"];
    [view setMapBlock:^(CBLJSONDict * _Nonnull doc, CBLMapEmitBlock  _Nonnull emit) {
        if([doc[@"type"] isEqualToString:kRecordDocType]
           &&[doc[@"accountBook"] isEqualToString:[accountBook.document.properties objectForKey:@"_id"]]) {
            emit(@"rname", nil);
        }
    }
              version:@"1"];
    return [self arrayFromView:view];
}

@end
