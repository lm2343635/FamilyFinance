//
//  AccountsTableViewController.m
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "AccountsTableViewController.h"
#import "Util.h"
#import "DaoManager.h"

@interface AccountsTableViewController ()

@end

@implementation AccountsTableViewController {
    DaoManager *dao;
    User *loginedUser;
    NSArray *accounts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    dao=[[DaoManager alloc] init];
    loginedUser=[dao.userDao findLogined];
    accounts=[dao.accountDao findByAccountBook:loginedUser.usingAccountBook];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    return accounts.count;
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"account"
                                                            forIndexPath:indexPath];
    UILabel *anameLabel=(UILabel *)[cell viewWithTag:0];
    anameLabel.text=[[accounts objectAtIndex:indexPath.row] aname];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Account *account=[accounts objectAtIndex:indexPath.row];
        [account deleteDocument:nil];
        accounts=[dao.accountDao findByAccountBook:loginedUser.usingAccountBook];
        [self.tableView reloadData];
    }
}

#pragma mark - Action
- (IBAction)addAccounts:(id)sender {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [Util showPlainTextInputAlertWithTitle:@"New Account"
                                andMessage:@"Input the name of new account."
                             andButtonName:@"Create"
                               andDelegate:self];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if(buttonIndex>0) {
        NSString *aname=[[alertView textFieldAtIndex:0] text];
        if(aname.length>0) {
            [dao.accountDao saveWithAname:aname
                           andAccountBook:loginedUser.usingAccountBook];
            accounts=[dao.accountDao findByAccountBook:loginedUser.usingAccountBook];
            [self.tableView reloadData];
        }
    }
}
@end
