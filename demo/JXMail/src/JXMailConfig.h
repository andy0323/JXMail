//
//  JXMailConfig.h
//  JXMail
//
//  Created by andy on 9/8/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXMailConfig : NSObject
/**
 *  信息是否全部录入
 */
@property (nonatomic, assign, readonly) BOOL isComplete;

/**
 *  初始化一个邮件配置对象
 */
- (JXMailConfig *)initWithHostname:(NSString *)hostname
                              port:(int)port
                          username:(NSString *)username
                          password:(NSString *)password
                       displayName:(NSString *)displayName;


#pragma mark - 邮件配置信息

/**
 *  服务器域名
 */
@property (nonatomic, copy) NSString *hostname;
/**
 *  服务器端口
 */
@property (nonatomic, assign) int port;
/**
 *  用户名
 */
@property (nonatomic, copy) NSString *username;
/**
 *  用户密码
 */
@property (nonatomic, copy) NSString *password;
/**
 *  用户昵称
 */
@property (nonatomic, copy) NSString *displayName;
@end
