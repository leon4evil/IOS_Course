//
//  MADViewController.h
//  Speed Text
//
//  Created by Luis Alfredo Hierro on 10/1/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController<UITextViewDelegate,UIAlertViewDelegate>
- (IBAction)startButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, retain) NSTimer *timer; //timer object
@property (weak, nonatomic) IBOutlet UILabel *charCounter;
@property (weak, nonatomic) IBOutlet UITextView *typingSpace;
- (IBAction)resetButton:(UIButton *)sender;
- (IBAction)getStats:(UIButton *)sender;


@end
