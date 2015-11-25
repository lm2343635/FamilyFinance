//
//  SelectClassificationTableViewController.m
//  FamilyFinance
//
//  Created by limeng on 11/24/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "SelectClassificationTableViewController.h"
#import "AddRecordViewController.h"
#import "DaoManager.h"

@interface SelectClassificationTableViewController ()

@end

@implementation SelectClassificationTableViewController {
    DaoManager *dao;
    NSArray *classifications;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    dao=[[DaoManager alloc] init];
    AccountBook *usingAccountBook=[dao.userDao findLogined].usingAccountBook;
    classifications=[dao.classificationDao findByAccountBook:usingAccountBook];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"classification"
                                                            forIndexPath:indexPath];
    UILabel *cnameLabel=(UILabel *)[cell viewWithTag:0];
    Classification *classification=[classifications objectAtIndex:indexPath.row];
    cnameLabel.text=classification.cname;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    AddRecordViewController *controller=[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    controller.classification=[classifications objectAtIndex:indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
