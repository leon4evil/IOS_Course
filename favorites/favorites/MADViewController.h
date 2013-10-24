//
//  MADViewController.h
//  favorites
//
//  Created by Luis Alfredo Hierro on 10/10/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *booLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (strong,nonatomic)Favorite *user;

@end
