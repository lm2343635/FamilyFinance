//
//  SelectTimeViewController.m
//  FamilyFinance
//
//  Created by limeng on 11/25/15.
//  Copyright © 2015 李大爷. All rights reserved.
//

#import "SelectTimeViewController.h"
#import "AddRecordViewController.h"

@interface SelectTimeViewController ()

@end

@implementation SelectTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (IBAction)useThisTime:(id)sender {
    if(DEBUG) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    AddRecordViewController *controller=[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    controller.time=[self.datePicker date];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
