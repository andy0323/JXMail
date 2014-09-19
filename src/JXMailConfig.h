//
//  JXMailConfig.h
//  JXMail
//
//  Created by andy on 9/8/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JXUserInfo;
@class JXServerInfo;
@interface JXMailConfig : NSObject
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


/**
 *  单例
 */
+ (instancetype)shareManager;
@end



#pragma mark -
#pragma mark -  服务设置

@interface JXServerInfo : NSObject
/**
 *  服务器域名
 */
@property (nonatomic, copy) NSString *hostname;
/**
 *  服务器端口
 */
@property (nonatomic, assign) int port;

- (id)initWithHostname:(NSString *)hostname
                  port:(int)port;
+ (id)infoWithHostname:(NSString *)hostname
                  port:(int)port;
@end



#pragma mark -
#pragma mark -  用户信息

@interface JXUserInfo : NSObject
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

- (id)initWithUsername:(NSString *)username
              password:(NSString *)password;
+ (id)infoWithUsername:(NSString *)username
              password:(NSString *)password;
@end
