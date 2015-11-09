//
//  SignupViewController.m
//  FamilyFinance
//
//  Created by 李大爷 on 11/9/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "SignupViewController.h"
#import "AppDelegate.h"
#import "User.h"

@interface SignupViewController ()

@end

@implementation SignupViewController {
    CBLDatabase *database;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    AppDelegate *delegate=[[UIApplication sharedApplication] delegate];
    database=delegate.database;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submit:(id)sender {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    NSString *email=self.emailTextField.text;
    NSString *username=self.usernameTextField.text;
    NSString *password=self.passwordTextField.text;
    NSString *repeatPassword=self.repeatPasswordtextField.text;
    if ([email isEqualToString:@""]||[username isEqualToString:@""]||
        [password isEqualToString:@""]||[repeatPassword isEqualToString:@""]||
        ![password isEqualToString:repeatPassword]) {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Tips"
                                                      message:@"User information incorrect!"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles: nil];
        [alert show];
    } else {
        User *user=[User modelForNewDocumentInDatabase:database];
        user.email=email;
        user.uname=username;
        user.password=password;
        user.login=false;
        NSError *error;
        if(![user save:&error]) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
@end
