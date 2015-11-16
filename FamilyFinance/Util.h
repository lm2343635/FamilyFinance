//
//  Util.h
//  AccountManagement
//
//  Created by 李大爷 on 15/5/4.
//  Copyright (c) 2015年 李大爷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Util : NSObject

//显示一个提示框
+(void)showAlert:(NSString *)message;

+(void)showPlainTextInputAlertWithTitle: (NSString *)title
                             andMessage: (NSString *)message
                          andButtonName: (NSString *)buttonName
                            andDelegate: (NSObject *)delegate;

@end
