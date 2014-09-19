//
//  JXAccountManager.h
//  JXMail
//
//  Created by andy on 9/18/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXAccount.h"
@interface JXAccountManager : NSObject
{
    NSMutableArray *_arrcounts;
}
/**
 *  当前使用的用户
 */
@property (nonatomic, strong) JXAccount *currentAccount;

/**
 *  获取单例
 */
+ (instancetype)shareManager;

/**
 *  添加用户信息
 *
 *  @param account 用户信息
 */
- (void)addAccount:(JXAccount *)account;

@end
