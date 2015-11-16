//
//  ShopDao.m
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "ShopDao.h"

@implementation ShopDao

- (Shop *)saveWithSname:(NSString *)sname
            andAccountBook:(AccountBook *)accountBook {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    Shop *shop=[Shop modelForNewDocumentInDatabase:self.database];
    shop.sname=sname;
    shop.sin=[NSNumber numberWithDouble:0.0];
    shop.sout=[NSNumber numberWithDouble:0.0];
    shop.accountBook=accountBook;
    NSError *error;
    if(![shop save:&error]) {
        NSLog(@"Error: %@", error.localizedDescription);
    }
    return shop;
}

- (NSArray *)findByAccountBook:(AccountBook *)accountBook {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    CBLView *view=[self.database viewNamed:@"shopsByAccountBook"];
    [view setMapBlock:^(CBLJSONDict * _Nonnull doc, CBLMapEmitBlock  _Nonnull emit) {
        if([doc[@"type"] isEqualToString:kShopDocType]
           &&[doc[@"accountBook"] isEqualToString:[accountBook.document.properties objectForKey:@"_id"]]) {
            emit(doc[@"sname"], nil);
        }
    }
              version:@"1"];
    return [self arrayFromView:view];
}

@end
