//
//  Util.m
//  AccountManagement
//
//  Created by 李大爷 on 15/5/4.
//  Copyright (c) 2015年 李大爷. All rights reserved.
//

#import "Util.h"

@implementation Util {
    id accessorySender;
}

+(void)showAlert:(NSString *)message {
    if(DEBUG==1) {
        NSLog(@"Running %@ '%@'",self.class,NSStringFromSelector(_cmd));
    }
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Tip"
                                                  message:message
                                                 delegate:nil
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
    [alert show];
}

+(void)showPlainTextInputAlertWithTitle:(NSString *)title
                             andMessage:(NSString *)message
                          andButtonName:(NSString *)buttonName
                            andDelegate:(NSObject *)delegate {
    if(DEBUG==1) {
        NSLog(@"Running %@ '%@'",self.class,NSStringFromSelector(_cmd));
    }
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:title
                                                  message:message
                                                 delegate:delegate
                                        cancelButtonTitle:@"Cancel"
                                        otherButtonTitles:buttonName, nil];
    alert.alertViewStyle=UIAlertViewStylePlainTextInput;
    [alert show];
}

@end
