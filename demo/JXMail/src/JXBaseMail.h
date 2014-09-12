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
#import <MailCore/MailCore.h>

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
 *  邮件配置信息
 */
@property (nonatomic, strong) JXMailConfig *config;

/**
 *  检测用户登录是否成功
 *
 *  @param checkAccountBlock 登录结果回调
 */
- (void)checkAccount:(JXCheckAccountBlock)checkAccountBlock;

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
