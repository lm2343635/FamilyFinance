//
//  MainTableViewController.m
//  FamilyFinance
//
//  Created by limeng on 11/25/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "MainTableViewController.h"
#import "DaoManager.h"
#import "DateTool.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController {
    DaoManager *dao;
    User *loginedUser;
    NSArray *records;
}

- (void)viewDidLoad {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [super viewDidLoad];
    dao=[[DaoManager alloc] init];
    loginedUser=[dao.userDao findLogined];
}

- (void) viewWillAppear:(BOOL)animated {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [super viewWillAppear:animated];
    records=[dao.recordDao findByAccoutBook:loginedUser.usingAccountBook];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    return records.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"record" forIndexPath:indexPath];
    UILabel *rnameLabel=(UILabel *)[cell viewWithTag:0];
    UILabel *informationLabel=(UILabel *)[cell viewWithTag:1];
    UILabel *amountLabel=(UILabel *)[cell viewWithTag:2];
    Record *record=[records objectAtIndex:indexPath.row];
    rnameLabel.text=record.rname;
    informationLabel.text=[NSString stringWithFormat:@"%@, %@",
                           record.classification.cname, [DateTool formateDate:record.time withFormat:DateFormatYearMonthDayHourMinutes]];
    amountLabel.text=[NSString stringWithFormat:@"%@", record.amount];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if(editingStyle==UITableViewCellEditingStyleDelete) {
        
    }
}

@end
