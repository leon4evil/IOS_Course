//
//  MADViewController.h
//  Media
//
//  Created by Luis Alfredo Hierro on 11/19/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface MADViewController : UIViewController<UIImagePickerControllerDelegate,UIActionSheetDelegate, UINavigationControllerDelegate, AVAudioPlayerDelegate>


- (IBAction)cammeraButtonTapped:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *actionButtonTapped;
- (IBAction)actionButtonTapped:(UIBarButtonItem *)sender;

@end
