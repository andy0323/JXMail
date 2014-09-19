//
//  JXMailPacket.h
//  JXMail
//
//  Created by andy on 9/8/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MailCore/MailCore.h>

@interface JXMailPacket : NSObject

/**
 *  收邮人昵称
 */
@property (nonatomic, copy) NSString *displayName;
/**
 *  收件人邮箱
 */
@property (nonatomic, copy) NSString *mailBox;
/**
 *  邮件主题
 */
@property (nonatomic, copy) NSString *subject;
/**
 *  邮件内容
 */
@property (nonatomic, copy) NSString *body;

/**
 *  初始化发出邮件
 */
- (id)initWithDisplayName:(NSString *)displayName
                  mailBox:(NSString *)mailBox
                  subject:(NSString *)subject
                     body:(NSString *)body;
@end
