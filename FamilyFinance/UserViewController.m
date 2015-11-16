//
//  UserViewController.m
//  FamilyFinance
//
//  Created by 李大爷 on 11/9/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "UserViewController.h"
#import "Util.h"
#import "UserDao.h"

@interface UserViewController ()

@end

@implementation UserViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
}

#pragma mark - Action

- (IBAction)login:(id)sender {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    NSString *email=self.emailTextField.text;
    NSString *password=self.passwordTextField.text;
    UserDao *userDao=[[UserDao alloc] init];
    User *user=[userDao findByEmail:email];
    if([user.password isEqualToString:password]) {
        user.login=true;
        [user save:nil];
        [Util showAlert:@"Login success!"];
    }
}
@end
