//
//  LoginViewController.m
//  JXMail
//
//  Created by andy on 9/15/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import "LoginViewController.h"
#import "JXMail.h"
#import "HomeViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"登录邮箱";
}


- (IBAction)login:(id)sender
{
    JXAccount *account = [JXAccount accountWithUsername:_usernameTF.text
                                               password:_passwordTF.text
                                               nickname:@"andy_nickname"];

    JXIMAP *IMAP = [JXIMAP mail];
    [IMAP checkAccount:account accountBlock:^(NSError *error) {
     if (error) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"登陆错误"
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"知道了"
                                                  otherButtonTitles:nil, nil];
            [alert show];
            
            return ;
        }
        
        HomeViewController *vc = [[HomeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}


@end
