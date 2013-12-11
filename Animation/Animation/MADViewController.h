//
//  MADViewController.h
//  Animation
//
//  Created by Luis Alfredo Hierro on 11/14/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *bounceBall;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISlider *ballSlider;
- (IBAction)ballSliderMoved:(UISlider *)sender;

@end
