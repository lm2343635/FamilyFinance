//
//  UserDao.m
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "UserDao.h"

@implementation UserDao

- (User *)saveWithEmail:(NSString *)email
               andUname:(NSString *)uname
            andPassword:(NSString *)password {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    User *user=[User modelForNewDocumentInDatabase:self.database];
    user.email=email;
    user.uname=uname;
    user.password=password;
    user.login=false;
    NSError *error;
    if(![user save:&error]) {
        NSLog(@"Error: %@", error.localizedDescription);
    }
    return user;
}

- (User *)findLogined {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    CBLView *view=[self.database viewNamed:@"userLogined"];
    if(!view.mapBlock) {
        [view setMapBlock:^(CBLJSONDict * _Nonnull doc, CBLMapEmitBlock  _Nonnull emit) {
            if ([doc[@"type"] isEqualToString:kUserDocType]&&[doc[@"login"] intValue]==1) {
                emit(doc[@"email"], nil);
            }
        }
                  version:@"2"];
    }
    return (User *)[self modelFromView:view];
}

- (User *)findByEmail:(NSString *)email {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    CBLView *view=[self.database viewNamed:@"userByEmail"];
    if(!view.mapBlock) {
        [view setMapBlock:^(CBLJSONDict * _Nonnull doc, CBLMapEmitBlock  _Nonnull emit) {
            if ([doc[@"type"] isEqualToString:kUserDocType]&&[doc[@"email"] isEqualToString:email]) {
                emit(doc[@"email"], nil);
            }
        }
                  version:@"1"];
    }
    return (User *)[self modelFromView:view];
}

@end
