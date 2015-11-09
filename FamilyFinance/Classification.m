//
//  Classification.m
//  FamilyFinance
//
//  Created by 李大爷 on 11/1/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "Classification.h"

@implementation Classification

@dynamic cname, cin, cout;

+(CBLQuery *)queryClassificationsInDatabase:(CBLDatabase *)database {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    CBLView* view = [database viewNamed: @"classifications"];
    if (!view.mapBlock) {
        // Register the map function, the first time we access the view:
        [view setMapBlock: MAPBLOCK({
            if ([doc[@"type"] isEqualToString:kClassificationDocType])
                emit(doc[@"title"], nil);
        })
              reduceBlock: nil
                  version: @"1"]; // bump version any time you change the MAPBLOCK body!
    }
    return [view createQuery];
}

-(void)awakeFromInitializer {
    self.type=kClassificationDocType;
}

@end
