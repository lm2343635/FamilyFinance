//
//  Classification.m
//  FamilyFinance
//
//  Created by 李大爷 on 11/1/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "Classification.h"

@implementation Classification

@dynamic cname, cin, cout, accountBook;

-(void)awakeFromInitializer {
    self.type=kClassificationDocType;
}

@end
