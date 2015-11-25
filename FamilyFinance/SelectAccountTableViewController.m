//
//  SelectAccountTableViewController.m
//  FamilyFinance
//
//  Created by limeng on 11/24/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "SelectAccountTableViewController.h"
#import "AddRecordViewController.h"
#import "DaoManager.h"

@interface SelectAccountTableViewController ()

@end

@implementation SelectAccountTableViewController {
    DaoManager *dao;
    NSArray *accounts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    dao=[[DaoManager alloc] init];
    AccountBook *usingAccountBook=[dao.userDao findLogined].usingAccountBook;
    accounts=[dao.accountDao findByAccountBook: usingAccountBook];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    return accounts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"account" forIndexPath:indexPath];
    UILabel *anameLabel=(UILabel *)[cell viewWithTag:0];
    Account *account=[accounts objectAtIndex:indexPath.row];
    anameLabel.text=account.aname;
    return cell;
}

#pragma mark - UITabelViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    AddRecordViewController *controller=[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    controller.account=[accounts objectAtIndex:indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
