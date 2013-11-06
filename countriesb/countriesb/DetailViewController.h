//
//  DetailViewController.h
//  countriesb
//
//  Created by Luis Alfredo Hierro on 10/24/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)NSMutableArray *countryList;

@end
