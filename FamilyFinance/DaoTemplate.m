//
//  DaoHelper.m
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "DaoTemplate.h"

@implementation DaoTemplate

- (instancetype)init {
    self=[super init];
    self.delegate=[[UIApplication sharedApplication] delegate];
    self.database=self.delegate.database;
    return self;
}

- (NSArray *)arrayFromView: (CBLView *)view {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    CBLQuery *query=[view createQuery];
    CBLQueryEnumerator *rows=[query run:nil];
    NSMutableArray *array=[[NSMutableArray alloc] init];
    for(CBLQueryRow *row in rows) {
        CBLModel *object;
        NSString *daoClassName=NSStringFromClass(self.class);
        if([daoClassName isEqualToString:@"UserDao"]) {
            object=[User modelForDocument:row.document];
        } else if([daoClassName isEqualToString:@"AccountBookDao"]) {
            object=[AccountBook modelForDocument:row.document];
        } else if([daoClassName isEqualToString:@"ClassificationDao"]) {
            object=[Classification modelForDocument:row.document];
        } else if([daoClassName isEqualToString:@"AccountDao"]) {
            object=[Account modelForDocument:row.document];
        } else if([daoClassName isEqualToString:@"ShopDao"]) {
            object=[Shop modelForDocument:row.document];
        } else if([daoClassName isEqualToString:@"RecordDao"]) {
            object=[Record modelForDocument:row.document];
        }
        [array addObject:object];
    }
    return array;
}

- (CBLModel *)modelFromView: (CBLView *)view {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    NSArray *array=[self arrayFromView:view];
    if(array.count==0) {
        return nil;
    }
    return [array objectAtIndex:0];
}

@end
