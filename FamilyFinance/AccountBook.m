//
//  AccountBook.m
//  FamilyFinance
//
//  Created by 李大爷 on 10/26/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "AccountBook.h"

@implementation AccountBook

@dynamic abname, owner;

-(void)awakeFromInitializer {
    self.type=kAccountBookDocType;
}

+ (NSArray *)queryAccountBooksInDatabase:(CBLDatabase *)database {
    CBLView *view=[database viewNamed:@"accountBooks"];
    if(!view.mapBlock) {
        [view setMapBlock:MAPBLOCK({
            if([doc[@"type"] isEqualToString:kAccountBookDocType]) {
                emit(doc[@"abname"], nil);
            }
        })
              reduceBlock:nil
                  version:@"1"];
    }
    CBLQuery *query=[view createQuery];
    NSMutableArray *accountBooks=[[NSMutableArray alloc] init];
    for(CBLQueryRow *row in [query run:nil]) {
        AccountBook *accountBook=[AccountBook modelForDocument:row.document];
        [accountBooks addObject:accountBook];
    }
    return  accountBooks;
}

@end
