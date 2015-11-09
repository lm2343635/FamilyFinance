//
//  UserViewController.h
//  FamilyFinance
//
//  Created by 李大爷 on 11/9/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)login:(id)sender;

@end
