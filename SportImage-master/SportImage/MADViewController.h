//
//  MADViewController.h
//  SportImage
//
//  Created by Luis Alfredo Hierro on 9/10/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
- (IBAction)buttonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *sportImage;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
- (IBAction)textFieldDoneEditing:(UITextField *)sender;

@end
