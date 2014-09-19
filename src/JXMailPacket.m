//
//  JXMailPacket.m
//  JXMail
//
//  Created by andy on 9/8/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import "JXMailPacket.h"

@implementation JXMailPacket

/**
 *  初始化发出邮件
 */
- (id)initWithDisplayName:(NSString *)displayName mailBox:(NSString *)mailBox subject:(NSString *)subject body:(NSString *)body
{
    if (self = [super init]) {
        _displayName = displayName;
        _mailBox = mailBox;
        _subject = subject;
        _body = body;
    }
    
    return self;
}

@end
