#import "JXHomeViewController.h"
#import "JXMail.h"

@interface JXHomeViewController ()

@end

@implementation JXHomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    MCOIMAPSession *imapSession = [[MCOIMAPSession alloc] init];
    imapSession.hostname = @"imap.163.com";
    imapSession.port = 993;
    imapSession.username = @"andy_ios@163.com";
    imapSession.password = @"ynwyygyje";
    imapSession.authType = MCOAuthTypeSASLPlain;
    imapSession.connectionType = MCOConnectionTypeTLS;
    
    // 检测用户填写信息是否正确
    MCOIMAPOperation *imapCheckOperation = [imapSession checkAccountOperation];
	[imapCheckOperation start:^(NSError *error) {
        
		if (error == nil) {
			NSLog(@"登录成功");
		} else {
			NSLog(@"登录出错, 错误原因: %@", error);
		}
    }];
   
}

@end
