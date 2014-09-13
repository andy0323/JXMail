#import "JXHomeViewController.h"
#import "JXMail.h"

#define MAIL_USERNAME @"mailcore_test@163.com"
#define MAIL_PASSWORD @"a123456"

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
    
    
#warning 该类需要进行修正
    config.hostname = @"smtp.163.com";
    config.port = 465;
    
    JXMailPacket *packet = [[JXMailPacket alloc] initWithDisplayName:@"andyJin"
                                                             mailBox:@"andy_ios@163.com"
                                                             subject:@"hello"
                                                                body:@"andy,hello!"];
    JXSMTP *SMTP = [[JXSMTP alloc] initWithConfig:config];
    [SMTP sendMail:packet compelete:^(NSError *error) {
        
        if (error) {
            NSLog(@"发送邮件出错");
            return ;
        }
        
        NSLog(@"发送成功");
    }];
}

@end
