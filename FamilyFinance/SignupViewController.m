//
//  SignupViewController.m
//  FamilyFinance
//
//  Created by 李大爷 on 11/9/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "SignupViewController.h"
#import "Util.h"
#import "UserDao.h"


@interface SignupViewController ()

@end

@implementation SignupViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }

}

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
        [Util showAlert:@"User information incorrect!"];
    } else {
        UserDao *userDao=[[UserDao alloc] init];
        [userDao saveWithEmail:email andUname:username andPassword:password];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
@end
