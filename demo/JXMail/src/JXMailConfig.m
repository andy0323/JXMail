#import "JXMailConfig.h"

@implementation JXMailConfig

/**
 *  初始化一个邮件配置对象
 */
- (JXMailConfig *)initWithHostname:(NSString *)hostname port:(int)port username:(NSString *)username password:(NSString *)password displayName:(NSString *)displayName
{
    if (self = [super init]) {
        self.hostname = hostname;
        self.port = port;
        self.username = username;
        self.password = password;
        self.displayName = displayName;
    }
    return self;
}

/**
 *  用户信息是否录入完整
 */
- (BOOL)isComplete
{
    return (self.hostname && self.port && self.username && self.password && self.displayName);
}
@end
