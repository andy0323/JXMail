#import "JXHomeViewController.h"
#import "JXMail.h"

#ifndef MAIL_USERNAME
    #define MAIL_USERNAME @"input your username"
#endif

#ifndef MAIL_PASSWORD
    #define MAIL_PASSWORD @"input your password"
#endif

@interface JXHomeViewController ()
@end

@implementation JXHomeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    
    JXMailConfig *config = [[JXMailConfig alloc] initWithHostname:@"imap.163.com"
                                                             port:993
                                                         username:MAIL_USERNAME
                                                         password:MAIL_PASSWORD
                                                      displayName:@"andyJin"];
    
    JXIMAP *IMAP = [[JXIMAP alloc] initWithConfig:config];
    [IMAP checkAccount:^(NSError *error) {
        
        if (error) {
            NSLog(@"登录失败");
            return ;
        }
        
        NSLog(@"登录成功");
        
    }];


    [IMAP receive:^(NSError *error, NSArray *packets) {
       
        if (error) {
            NSLog(@"获取邮件出错");
            return ;
        }
        
        NSLog(@"获取%d封邮件", packets.count);
    }];
}

@end
