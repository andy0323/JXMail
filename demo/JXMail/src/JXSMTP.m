//
//  JXSMTP.m
//  JXMail
//
//  Created by andy on 9/8/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import "JXSMTP.h"

@implementation JXSMTP

- (id)init
{
    if (self = [super init]) {
        
        _session = [[MCOSMTPSession alloc] init];
        _session.hostname = SMTP_HOSTNAME;
        _session.port = SMTP_PORT;
        _session.connectionType = MCOConnectionTypeTLS;
        
        JXAccount *account = [JXAccountManager shareManager].currentAccount;
        _session.username = account.username;
        _session.password = account.password;
    }
    return self;
}

/**
 *  验证用户信息
 */
- (void)checkAccount:(JXCheckAccountBlock)checkAccountBlock
{
    
}

/**
 *  接收邮件
 */
- (void)receive:(JXReceiveBlock)receiveBlock
{
    
}

/**
 *  发送邮件
 */
- (void)sendMail:(JXMailPacket *)packet compelete:(JXSendBlock)sendBlock
{
    JXAccount *acount = [[JXAccountManager shareManager] currentAccount];
    
    // 发信人信息
    MCOAddress *from = [MCOAddress addressWithDisplayName:acount.nickname
                                                  mailbox:acount.username];
    // 收信人信息
    MCOAddress *to = [MCOAddress addressWithDisplayName:packet.displayName
                                                mailbox:packet.mailBox];
    // 发送内容
    MCOMessageBuilder *builder = [[MCOMessageBuilder alloc] init];
    [[builder header] setFrom:from];
    [[builder header] setTo:@[to]];
    [[builder header] setSubject:packet.subject];
    [builder setHTMLBody:packet.body];
    NSData * data = [builder data];
    
    // 发送任务
    MCOSMTPSendOperation *sendOperation =
    [_session sendOperationWithData:data];
    
    // 发送结果
    [sendOperation start:^(NSError *error) {
        
        if (error) {
            sendBlock(error);
            return ;
        }
        
        sendBlock(nil);
    }];
}

@end
