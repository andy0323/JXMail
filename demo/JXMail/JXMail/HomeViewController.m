//
//  HomeViewController.m
//  JXMail
//
//  Created by andy on 9/15/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import "HomeViewController.h"
#import "JXMail.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                              style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)receiveMail
{
    
    JXIMAP *IMAP = [JXIMAP mail];
    [IMAP receive:^(NSError *error, NSArray *packets) {
        
        if (error) {
            NSLog(@"获取邮件出错");
            return ;
        }
        _arr = packets;
        [_tableView reloadData];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"收件箱";
    
    [self createTableView];
    [self receiveMail];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    MCOIMAPMessage *msg = [_arr objectAtIndex:indexPath.row];
    MCOMessageHeader *header = msg.header;
    cell.textLabel.text = header.sender.mailbox;
    cell.detailTextLabel.text = header.subject;

    return cell;
}

@end
