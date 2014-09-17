//
//  JXAccount.m
//  JXMail
//
//  Created by andy on 9/17/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import "JXAccount.h"

@implementation JXAccount

- (id)initWithUsername:(NSString *)username password:(NSString *)password
{
    if (self = [super init]) {
        self.username = username;
        self.password = password;
    }
    return self;
}

+ (id)accountWithUsername:(NSString *)username password:(NSString *)password
{
    return [[self alloc] initWithUsername:username password:password];
}

@end
