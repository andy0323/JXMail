//
//  HomeViewController.h
//  JXMail
//
//  Created by andy on 9/15/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JXMailConfig;
@interface HomeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_arr;
}
@property (nonatomic, strong) JXMailConfig *config;

@end
