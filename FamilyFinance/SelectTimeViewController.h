//
//  SelectTimeViewController.h
//  FamilyFinance
//
//  Created by limeng on 11/25/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTimeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)useThisTime:(id)sender;

@end
