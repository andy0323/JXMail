//
//  LoginViewController.h
//  JXMail
//
//  Created by andy on 9/15/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JXMailConfig;
@interface LoginViewController : UIViewController
{
    JXMailConfig *_config;
}

@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end
