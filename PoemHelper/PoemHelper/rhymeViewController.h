//
//  rhymeViewController.h
//  PoemHelper
//
//  Created by Luis Alfredo Hierro on 11/7/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PoemViewController.h"


@interface rhymeViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property(strong,nonatomic)NSMutableArray *rhymeList;
@property(strong,nonatomic)NSString *wordToBeAdded;

@property(strong,nonatomic)NSString *poem;

@end
