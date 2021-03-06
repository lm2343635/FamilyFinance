//
//  ClassificationsTableViewController.m
//  FamilyFinance
//
//  Created by 李大爷 on 11/1/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "ClassificationsTableViewController.h"
#import "Util.h"
#import "DaoManager.h"

@interface ClassificationsTableViewController ()

@end

@implementation ClassificationsTableViewController {
    DaoManager *dao;
    User *loginedUser;
    NSArray *classifications;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    dao=[[DaoManager alloc] init];
    loginedUser=[dao.userDao findLogined];
    classifications=[dao.classificationDao findByAccountBook:loginedUser.usingAccountBook];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    return classifications.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"classification" forIndexPath:indexPath];
    UILabel *cnameLabel=(UILabel *)[cell viewWithTag:0];
    cnameLabel.text=[[classifications objectAtIndex:indexPath.row] cname];
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Classification *classification=[classifications objectAtIndex:indexPath.row];
        [classification deleteDocument:nil];
        classifications=[dao.classificationDao findByAccountBook:loginedUser.usingAccountBook];
        [self.tableView reloadData];
    }
}

#pragma mark - Action
- (IBAction)addClassification:(id)sender {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [Util showPlainTextInputAlertWithTitle:@"New Classification"
                                andMessage:@"Input the name of new classification."
                             andButtonName:@"Create"
                               andDelegate:self];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if(buttonIndex>0) {
        NSString *cname=[[alertView textFieldAtIndex:0] text];
        if(cname.length>0) { 
             [dao.classificationDao saveWithCname:cname
                                    inAccountBook:loginedUser.usingAccountBook];
            classifications=[dao.classificationDao findByAccountBook:loginedUser.usingAccountBook];
            [self.tableView reloadData];
        }
    }
}

@end
