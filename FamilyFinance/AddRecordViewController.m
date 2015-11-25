//
//  AddRecordViewController.m
//  FamilyFinance
//
//  Created by limeng on 11/25/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "AddRecordViewController.h"
#import "DateTool.h"

@interface AddRecordViewController ()

@end

@implementation AddRecordViewController {
    DaoManager *dao;
    User *loginedUser;
}

- (void)viewDidLoad {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [super viewDidLoad];
    dao=[[DaoManager alloc] init];
    loginedUser=[dao.userDao findLogined];
}

- (void)viewWillAppear:(BOOL)animated {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [super viewWillAppear:animated];
    if(self.classification!=nil) {
        [self.classificationButton setTitle:self.classification.cname
                                   forState:UIControlStateNormal];
    }
    if(self.account!=nil) {
        [self.accountButton setTitle:self.account.aname
                            forState:UIControlStateNormal];
    }
    if(self.shop!=nil) {
        [self.shopButton setTitle:self.shop.sname
                         forState:UIControlStateNormal];
    }
    if(self.time!=nil) {
        [self.timeButton setTitle:[DateTool formateDate:self.time withFormat:DateFormatYearMonthDayHourMinutes]
                         forState:UIControlStateNormal];
    }
}

- (IBAction)saveRecord:(id)sender {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    NSString *rname=self.recordNameTextField.text;
    double amount=[self.amountTextField.text doubleValue];
    Record *record=[dao.recordDao saveWithRname:rname
                                        andTime:self.time
                                      andAmount:amount
                              andClassification:self.classification
                                      andAcount:self.account
                                        andShop:self.shop
                                        andUser:loginedUser
                                 andAccountBook:loginedUser.usingAccountBook];
    if(record) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
