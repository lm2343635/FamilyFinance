//
//  UserViewController.m
//  FamilyFinance
//
//  Created by 李大爷 on 11/9/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "UserViewController.h"
#import "AppDelegate.h"
#import "User.h"

@interface UserViewController ()

@end

@implementation UserViewController {
    AppDelegate *delegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    delegate=[[UIApplication sharedApplication] delegate];
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

#pragma mark - Action

- (IBAction)login:(id)sender {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    NSString *email=self.emailTextField.text;
    NSString *password=self.passwordTextField.text;
    NSArray *users=[User queryUsersInDataBase:delegate.database];
    for(User * user in users) {
        if([user.email isEqualToString:email]&&[user.password isEqualToString:password]) {
            user.login=true;
            [user save:nil];
            [delegate showMessage:@"Login success!"];
            break;
        }
    }
}
@end
