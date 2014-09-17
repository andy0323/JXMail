//
//  JXBaseMail.h
//  JXMail
//
//  Created by andy on 9/8/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXMailConfig.h"
#import "JXMailPacket.h"
#import "JXAccount.h"
#import <MailCore/MailCore.h>

// 配置项
#define IMAP_HOSTNAME @""
#define IMAP_PORT 400

#define POP_HOSTNAME @""
#define POP_PORT 400

#define SMTP_HOSTNAME @""
#define SMTP_PORT 400


/** FolderType on IMAP **/
#define MAIL_FOLDER_INBOX    @"INBOX"
#define MAIL_FOLDER_DRAFTS   @"&g0l6P3ux-"
#define MAIL_FOLDER_SENT     @"&XfJT0ZAB-"
#define MAIL_FOLDER_TRASH    @"&XfJSIJZk-"


/**
 *  尝试登录回调
 */
typedef void (^JXCheckAccountBlock) (NSError *error);
/**
 *  接受邮箱中邮件回调Block
 */
typedef void (^JXReceiveBlock) (NSError *error, NSArray *packets);
/**
 *  发送邮件回调Block
 */
typedef void (^JXSendBlock)(NSError *error);


@interface JXBaseMail : NSObject
{

}
/**
 *  服务器域名
 */
@property (nonatomic, copy) NSString *hostname;
/**
 *  服务器端口
 */
@property (nonatomic, assign) int port;
/**
 *  构造函数
 */
+ (id)mail;

/**
 *  检测用户登录是否成功
 *
 *  @param checkAccountBlock 登录结果回调
 */
- (void)checkAccount:(JXAccount *)account
        accountBlock:(JXCheckAccountBlock)checkAccountBlock;

/**
 *  接收邮件信息
 *
 *  @param receiveBlock 接收邮件回调
 */
- (void)receive:(JXReceiveBlock)receiveBlock;

/**
 *  发送一封邮件
 *
 *  @param packet    发送邮件的信息包
 *  @param sendBlock 发送邮件回调Block
 */
- (void)sendMail:(JXMailPacket *)packet
       compelete:(JXSendBlock)sendBlock;
@end
