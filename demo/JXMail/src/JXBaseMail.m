#import "JXBaseMail.h"

@implementation JXBaseMail

- (id)initWithConfig:(JXMailConfig *)config
{
    if (self = [super init]) {
        self.config = config;
    }
    return self;
}
+ (id)config:(JXMailConfig *)config
{
    return [[self alloc] initWithConfig:config];
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
