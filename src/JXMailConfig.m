#import "JXMailConfig.h"

@implementation JXMailConfig

+ (instancetype)shareManager
{
    static JXMailConfig *single;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!single) {
            single = [[self alloc] init];
        }
    });
    return single;
}
@end



#pragma mark -
#pragma mark -  服务设置

@implementation JXServerInfo

- (id)initWithHostname:(NSString *)hostname port:(int)port
{
    if (self = [super init]) {
        self.hostname = hostname;
        self.port = port;
    }
    return self;
}
+ (id)infoWithHostname:(NSString *)hostname port:(int)port
{
    return [self infoWithHostname:hostname port:port];
}
@end



#pragma mark -
#pragma mark -  用户信息

@implementation JXUserInfo

- (id)initWithUsername:(NSString *)username password:(NSString *)password
{
    if (self = [super init]) {
        self.username = username;
        self.password = password;
    }
    return self;
}
+ (id)infoWithUsername:(NSString *)username password:(NSString *)password
{
    return [self infoWithUsername:username password:password];
}
@end