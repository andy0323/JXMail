//
//  JXIMAP.m
//  JXMail
//
//  Created by andy on 9/8/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import "JXIMAP.h"

@implementation JXIMAP

- (id)init
{
    if (self = [super init]) {
        _session = [[MCOIMAPSession alloc] init];
        _session.hostname = IMAP_HOSTNAME;
        _session.port = IMAP_PORT;
        _session.connectionType = MCOConnectionTypeTLS;
        
        if ([JXAccountManager shareManager].currentAccount) {
            JXAccount *account = [JXAccountManager shareManager].currentAccount;
            _session.username = account.username;
            _session.password = account.password;
        }
    }
    return self;
}

/**
 *  验证用户信息
 */
- (void)checkAccount:(JXAccount *)account accountBlock:(JXCheckAccountBlock)checkAccountBlock
{
    _session.username = account.username;
    _session.password = account.password;
    
    // 验证用户基本信息
	[[_session checkAccountOperation] start:^(NSError *error) {
        
        // 验证成功
		if (error == nil) {
            
            [JXAccountManager shareManager].currentAccount = account;
            [[JXAccountManager shareManager] addAccount:account];
            
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
