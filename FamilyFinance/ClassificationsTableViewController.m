//
//  ClassificationsTableViewController.m
//  FamilyFinance
//
//  Created by 李大爷 on 11/1/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "ClassificationsTableViewController.h"
#import "AppDelegate.h"
#import "Classification.h"

@interface ClassificationsTableViewController ()

@end

@implementation ClassificationsTableViewController {
    CBLDatabase *database;
    NSMutableArray *classifications;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    database=app.database;
    [self loadClassification];
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
        [self loadClassification];
    }
}

#pragma mark - Buttons
- (IBAction)addClassification:(id)sender {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"New Classification"
                                                  message:@"Input the name of new classification."
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
        NSString *cname=[[alertView textFieldAtIndex:0] text];
        if(cname.length>0) {
            Classification *classification=[Classification modelForNewDocumentInDatabase:database];
            classification.cname=cname;
            classification.cin=[NSNumber numberWithDouble:0.0];
            classification.cout=[NSNumber numberWithDouble:0.0];
            NSError *error;
            if(![classification save:&error]) {
                NSLog(@"Cannot create a new list with error: %@", [error localizedDescription]);
            }
            NSLog(@"Create a new classification with cname=%@", cname);
            [self loadClassification];
        }
    }
}

-(void)loadClassification {
    CBLQuery *query=[Classification queryClassificationsInDatabase:database];
    CBLQueryEnumerator *rows=[query run:nil];
    classifications=[[NSMutableArray alloc] init];
    for(CBLQueryRow *row in rows) {
        Classification *classification=[Classification modelForDocument:row.document];
        [classifications addObject: classification];
    }
    [self.tableView reloadData];
}
@end
