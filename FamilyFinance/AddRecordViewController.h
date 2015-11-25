//
//  AddRecordViewController.h
//  FamilyFinance
//
//  Created by limeng on 11/25/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DaoManager.h"

@interface AddRecordViewController : UIViewController

@property (strong, nonatomic) Classification *classification;
@property (strong, nonatomic) Account *account;
@property (strong, nonatomic) Shop *shop;
@property (strong, nonatomic) NSDate *time;

@property (weak, nonatomic) IBOutlet UITextField *recordNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UIButton *classificationButton;
@property (weak, nonatomic) IBOutlet UIButton *accountButton;
@property (weak, nonatomic) IBOutlet UIButton *shopButton;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;

- (IBAction)saveRecord:(id)sender;

@end
