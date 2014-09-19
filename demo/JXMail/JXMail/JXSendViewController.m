//
//  JXSendViewController.m
//  JXMail
//
//  Created by andy on 9/19/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import "JXSendViewController.h"

@interface JXSendViewController ()

@end

@implementation JXSendViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *sendItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(sendMail)];
    self.navigationItem.rightBarButtonItem = sendItem;
}

- (void)sendMail
{
    JXMailPacket *packet = [[JXMailPacket alloc] initWithDisplayName:self.displayNameTF.text
                                                             mailBox:self.mailBoxTF.text
                                                             subject:self.subjectTF.text
                                                                body:self.bodyTV.text];
    JXSMTP *SMTP = [JXSMTP mail];
    [SMTP sendMail:packet compelete:^(NSError *error) {
        
        if (error) {
            NSLog(@"发送失败");
            return ;
        }
        
        NSLog(@"发送成功");
    }];
}


@end
