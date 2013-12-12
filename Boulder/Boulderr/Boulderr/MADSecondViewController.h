//
//  MADSecondViewController.h
//  Boulderr
//
//  Created by Luis Alfredo Hierro on 10/17/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADSecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextView *questionTextView;
- (IBAction)submitQuestion:(UIButton *)sender;

@end
