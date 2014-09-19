//
//  JXSendViewController.h
//  JXMail
//
//  Created by andy on 9/19/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXMail.h"
@interface JXSendViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *displayNameTF;
@property (weak, nonatomic) IBOutlet UITextField *mailBoxTF;
@property (weak, nonatomic) IBOutlet UITextField *subjectTF;
@property (weak, nonatomic) IBOutlet UITextView *bodyTV;

@end
