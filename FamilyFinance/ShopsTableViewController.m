//
//  ShopsTableViewController.m
//  FamilyFinance
//
//  Created by limeng on 11/16/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "ShopsTableViewController.h"
#import "Util.h"
#import "DaoManager.h"

@interface ShopsTableViewController ()

@end

@implementation ShopsTableViewController {
    DaoManager *dao;
    User *loginedUser;
    NSArray *shops;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    dao=[[DaoManager alloc] init];
    loginedUser=[dao.userDao findLogined];
    shops=[dao.shopDao findByAccountBook:loginedUser.usingAccountBook];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    return shops.count;
}
#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shop"
                                                            forIndexPath:indexPath];
    UILabel *snameLabel=(UILabel *)[cell viewWithTag:0];
    snameLabel.text=[[shops objectAtIndex:indexPath.row] sname];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Shop *shop=[shops objectAtIndex:indexPath.row];
        [shop deleteDocument:nil];
        shops=[dao.shopDao findByAccountBook:loginedUser.usingAccountBook];
        [self.tableView reloadData];
    }
}

#pragma mark - Action
- (IBAction)addShop:(id)sender {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [Util showPlainTextInputAlertWithTitle:@"New Shop"
                                andMessage:@"Input the name of new shop."
                             andButtonName:@"Create"
                               andDelegate:self];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if(buttonIndex>0) {
        NSString *sname=[[alertView textFieldAtIndex:0] text];
        if(sname.length>0) {
            [dao.shopDao saveWithSname:sname
                        andAccountBook:loginedUser.usingAccountBook];
            shops=[dao.shopDao findByAccountBook:loginedUser.usingAccountBook];
            [self.tableView reloadData];
        }
    }
}
@end
