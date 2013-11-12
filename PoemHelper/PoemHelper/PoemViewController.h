//
//  PoemViewController.h
//  PoemHelper
//
//  Created by Luis Alfredo Hierro on 11/7/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PoemViewController : UIViewController <NSXMLParserDelegate>
@property  (strong, nonatomic)  NSMutableString *rhymesString;//will store string with commass that we'll turn into array
@property (weak, nonatomic) IBOutlet UITextField *wordToRhyme;
@property (weak, nonatomic) IBOutlet UITextView *poemTextView;


@end
