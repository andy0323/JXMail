//
//  JXAccountManager.m
//  JXMail
//
//  Created by andy on 9/18/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import "JXAccountManager.h"

@implementation JXAccountManager
+ (instancetype)shareManager
{
    static JXAccountManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}

- (id)init
{
    if (self = [super init]) {
        _arrcounts = [NSMutableArray array];
    }
    return self;
}

- (void)addAccount:(JXAccount *)account
{
    [_arrcounts addObject:account];
}


@end
