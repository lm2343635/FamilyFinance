//
//  SelectShopTableViewController.m
//  FamilyFinance
//
//  Created by limeng on 11/25/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "SelectShopTableViewController.h"
#import "AddRecordViewController.h"
#import "DaoManager.h"

@interface SelectShopTableViewController ()

@end

@implementation SelectShopTableViewController {
    DaoManager *dao;
    NSArray *shops;
}

- (void)viewDidLoad {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [super viewDidLoad];
    dao=[[DaoManager alloc] init];
    AccountBook *usingAccountBook=[dao.userDao findLogined].usingAccountBook;
    shops=[dao.shopDao findByAccountBook:usingAccountBook];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    return shops.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shop" forIndexPath:indexPath];
    UILabel *snameLabel=(UILabel *)[cell viewWithTag:0];
    Shop *shop=[shops objectAtIndex:indexPath.row];
    snameLabel.text=shop.sname;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    AddRecordViewController *controller=[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    controller.shop=[shops objectAtIndex:indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
