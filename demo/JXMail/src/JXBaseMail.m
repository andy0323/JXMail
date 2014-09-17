#import "JXBaseMail.h"


@implementation JXBaseMail

+ (id)mail
{
    return [[self alloc] init];
}

/**
 *  检测用户登录是否成功
 */
- (void)checkAccount:(JXAccount *)account accountBlock:(JXCheckAccountBlock)checkAccountBlock
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
