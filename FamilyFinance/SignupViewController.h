//
//  SignupViewController.h
//  FamilyFinance
//
//  Created by 李大爷 on 11/9/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *repeatPasswordtextField;

- (IBAction)submit:(id)sender;

@end
