//
//  MADViewController.h
//  Beattles
//
//  Created by Luis Alfredo Hierro on 9/18/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *beatlesImage;
@property (weak, nonatomic) IBOutlet UILabel *beatlesLabel;
- (IBAction)changeImage:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *imageControl;

@property (weak, nonatomic) IBOutlet UISwitch *capitalizedSwitch;
- (IBAction)updateFont:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UILabel *fontSizeLabel;

- (IBAction)changeFontSize:(UISlider *)sender;
@end
