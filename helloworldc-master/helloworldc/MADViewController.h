//
//  MADViewController.h
//  helloworldc
//
//  Created by Luis Alfredo Hierro on 9/11/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *helloLabel;
- (IBAction)helloButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *worldLabel;

@end
