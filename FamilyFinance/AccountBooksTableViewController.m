//
//  AccountBooksTableViewController.m
//  FamilyFinance
//
//  Created by 李大爷 on 11/9/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "AccountBooksTableViewController.h"
#import "AppDelegate.h"
#import "User.h"
#import "AccountBook.h"

@interface AccountBooksTableViewController ()

@end

@implementation AccountBooksTableViewController {
    AppDelegate *delegate;
    NSArray *accountBooks;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    delegate=[[UIApplication sharedApplication] delegate];
    accountBooks=[AccountBook queryAccountBooksInDatabase:delegate.database];
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
        accountBooks=[AccountBook queryAccountBooksInDatabase:delegate.database];
        [self.tableView reloadData];
    }
}

#pragma mark - Action
- (IBAction)addAccountBook:(id)sender {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"New Account Book"
                                                  message:@"Input the name of new account book."
                                                 delegate:self
                                        cancelButtonTitle:@"Cancel"
                                        otherButtonTitles:@"Create", nil];
    alert.alertViewStyle=UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if(buttonIndex>0) {
        NSString *abname=[[alertView textFieldAtIndex:0] text];
        if(abname.length>0) {
            NSArray *users=[User queryUsersInDataBase:delegate.database];
            User *usingUser;
            for(User *user in users) {
                if(user.login==true) {
                    usingUser=user;
                    break;
                }
            }
            AccountBook *accountBook=[AccountBook modelForNewDocumentInDatabase:delegate.database];
            accountBook.abname=abname;
            accountBook.owner=usingUser;
            NSError *error;
            if(![accountBook save:&error]) {
                NSLog(@"Error: %@", error.localizedDescription);
            }
            accountBooks=[AccountBook queryAccountBooksInDatabase:delegate.database];
            [self.tableView reloadData];
        }
    }
}
@end
