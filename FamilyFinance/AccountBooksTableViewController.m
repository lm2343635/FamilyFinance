//
//  AccountBooksTableViewController.m
//  FamilyFinance
//
//  Created by 李大爷 on 11/9/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "AccountBooksTableViewController.h"
#import "DaoManager.h"
#import "Util.h"

@interface AccountBooksTableViewController ()

@end

@implementation AccountBooksTableViewController {
    DaoManager *dao;
    User *loginedUser;
    NSArray *accountBooks;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    dao=[[DaoManager alloc] init];
    loginedUser=[dao.userDao findLogined];
    accountBooks=[dao.accountBookDao findByUser:loginedUser];
}

#pragma mark - UITableViewDataSoure 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    return accountBooks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"accountBook"
                                                          forIndexPath:indexPath];
    UILabel *abnameLabel=(UILabel *)[cell viewWithTag:0];
    AccountBook *accountBook=[accountBooks objectAtIndex:indexPath.row];
    abnameLabel.text=accountBook.abname;
    return cell;
}

#pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AccountBook *accountBook=[accountBooks objectAtIndex:indexPath.row];
        [accountBook deleteDocument:nil];
        accountBooks=[dao.accountBookDao findByUser:loginedUser];
        [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    loginedUser.usingAccountBook=[accountBooks objectAtIndex:indexPath.row];
    [loginedUser save:nil];
    [Util showAlert: [NSString stringWithFormat:@"Using Account Book set as %@", loginedUser.usingAccountBook.abname]];
}

#pragma mark - Action
- (IBAction)addAccountBook:(id)sender {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [Util showPlainTextInputAlertWithTitle:@"New Account Book"
                                andMessage:@"Input the name of new account book."
                             andButtonName:@"Create"
                               andDelegate:self];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if(buttonIndex>0) {
        NSString *abname=[[alertView textFieldAtIndex:0] text];
        if(abname.length>0) {
            [dao.accountBookDao saveWithAbname:abname
                                       forUser:loginedUser];
            accountBooks=[dao.accountBookDao findByUser:loginedUser];
            [self.tableView reloadData];
        }
    }
}
@end
