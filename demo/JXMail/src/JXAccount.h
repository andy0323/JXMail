//
//  JXAccount.h
//  JXMail
//
//  Created by andy on 9/17/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXAccount : NSObject
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
@property (nonatomic, copy) NSString *nickname;

/**
 *  构造方法
 */
- (id)initWithUsername:(NSString *)username
              password:(NSString *)password
              nickname:(NSString *)nickname;
/**
 *  构造方法
 */
+ (id)accountWithUsername:(NSString *)username
                 password:(NSString *)password
                 nickname:(NSString *)nickname;
@end
