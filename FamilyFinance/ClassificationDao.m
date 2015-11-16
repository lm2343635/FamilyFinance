//
//  ClassificationDao.m
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "ClassificationDao.h"

@implementation ClassificationDao

- (Classification *)saveWithCname:(NSString *)cname
                    inAccountBook:(AccountBook *)accountBook {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    Classification *classification=[Classification modelForNewDocumentInDatabase:self.database];
    classification.cname=cname;
    classification.cin=[NSNumber numberWithDouble:0.0];
    classification.cout=[NSNumber numberWithDouble:0.0];
    classification.accountBook=accountBook;
    NSError *error;
    if(![classification save:&error]) {
        NSLog(@"Error: %@", error.localizedDescription);
    }
    return classification;
}

- (NSArray *)findByAccountBook:(AccountBook *)accountBook {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    CBLView *view=[self.database viewNamed:@"classificationsByAccountBook"];
    [view setMapBlock:^(CBLJSONDict * _Nonnull doc, CBLMapEmitBlock  _Nonnull emit) {
        if([doc[@"type"] isEqualToString:kClassificationDocType]
           &&[doc[@"accountBook"] isEqualToString:[accountBook.document.properties objectForKey:@"_id"]]) {
            emit(@"cname", nil);
        }
    }
              version:@"2"];

    return [self arrayFromView:view];
}

@end
