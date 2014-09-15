#import "JXBaseMail.h"


@implementation JXBaseMail

- (id)initWithHostname:(NSString *)hostname port:(int)port
{
    if (self = [super init]) {
        self.hostname = hostname;
        self.port = port;
    }
    return self;
}
+ (id)mailWithHostname:(NSString *)hostname port:(int)port
{
    return [[self alloc] initWithHostname:hostname port:port];
}

/**
 *  检测用户登录是否成功
 */
- (void)checkAccount:(JXCheckAccountBlock)checkAccountBlock
{

}

/**
 *  接收邮件信息
 */
- (void)receive:(JXReceiveBlock)receiveBlock
{

}

/**
 *  发送一封邮件
 */
- (void)sendMail:(id)packet compelete:(JXSendBlock)sendBlock
{

}

@end
