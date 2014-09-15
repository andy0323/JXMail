//
//  JXIMAP.m
//  JXMail
//
//  Created by andy on 9/8/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import "JXIMAP.h"

@implementation JXIMAP

- (id)initWithHostname:(NSString *)hostname port:(int)port
{
    if (self = [super initWithHostname:hostname port:port]) {
        
        JXMailConfig *config = [JXMailConfig shareManager];
        
        _session = [[MCOIMAPSession alloc] init];
        _session.hostname = config.serverInfo.hostname;
        _session.port = config.serverInfo.port;
        _session.username = config.userInfo.username;
        _session.password = config.userInfo.password;
        _session.connectionType = MCOConnectionTypeTLS;
    }
    return self;
}

/**
 *  验证用户信息
 */
- (void)checkAccount:(JXCheckAccountBlock)checkAccountBlock
{
    // 验证用户基本信息
	[[_session checkAccountOperation] start:^(NSError *error) {
        
        // 验证成功
		if (error == nil) {
            
            checkAccountBlock(nil);
       
        // 验证失败
		} else {
            
            checkAccountBlock(error);
		}
        
    }];
}

/**
 *  接收邮件
 */
- (void)receive:(JXReceiveBlock)receiveBlock
{
    MCOIMAPMessagesRequestKind requestKind = (MCOIMAPMessagesRequestKind)
	(  MCOIMAPMessagesRequestKindHeaders
     | MCOIMAPMessagesRequestKindStructure
     | MCOIMAPMessagesRequestKindInternalDate
     | MCOIMAPMessagesRequestKindHeaderSubject
     | MCOIMAPMessagesRequestKindFlags);
    
    NSString *folder = MAIL_FOLDER_INBOX;
    MCOIndexSet *uids =
    [MCOIndexSet indexSetWithRange:MCORangeMake(1, UINT64_MAX)];
    
    MCOIMAPFetchMessagesOperation *fetchOperation =
    [_session fetchMessagesByUIDOperationWithFolder:folder
                                           requestKind:requestKind
                                                  uids:uids];
    [fetchOperation start:^(NSError * error, NSArray * fetchedMessages, MCOIndexSet * vanishedMessages) {

        if (error) {
            receiveBlock(error, nil);
            return ;
        }
        
        receiveBlock(nil, fetchedMessages);
    }];
}

/**
 *  发送邮件
 */
- (void)sendMail:(JXMailPacket *)packet compelete:(JXSendBlock)sendBlock
{

}

@end
