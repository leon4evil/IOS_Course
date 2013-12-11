//
//  MADViewController.m
//  Task
//
//  Created by Luis Alfredo Hierro on 12/3/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADViewController.h"
#import "MADArchive.h"

@interface MADViewController ()

@end

@implementation MADViewController

#define kFilename @"archive"//archieve file name
#define kDataKey @"Data"




-(NSString*)dataFilePath{
    //locates the document directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory=[paths objectAtIndex:0];
    //created the full path to our data file
    return [docDirectory stringByAppendingPathComponent:kFilename];



}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *filepath=[self dataFilePath];
    //check to see if the file exists
    if([[NSFileManager defaultManager] fileExistsAtPath:filepath]){
        NSData *data=[[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
        NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        //read the objects from the unarchiver
        MADArchive *taskArchive = [unarchiver decodeObjectForKey:kDataKey];
        [unarchiver finishDecoding];
        
        _task1.text= taskArchive.taskone;
        _task2.text=taskArchive.tasktwo;
        _task3.text=taskArchive.taskthree;
        _task4.text=taskArchive.taskfour;
        
    }

    
    
    
UIApplication *app=[UIApplication sharedApplication];//application instance
//suscribe to the UIApplicationWillResignActiveNotification notification
    NSLog(@"I hate you!!!!");
[[NSNotificationCenter defaultCenter] addObserver:self
                                         selector:@selector
 (applicationWillResignActive:)name:
 UIApplicationWillResignActiveNotification object:app];

}


//called when the UIApplicationWillResignActiveNotification notification is posted

-(void)applicationWillResignActive:(NSNotification *)notification{
    
    
    NSLog(@"I hate you!!!!");
    MADArchive *taskArchive=[[MADArchive alloc]init];
    
    taskArchive.taskone=_task1.text;
    taskArchive.tasktwo=_task2.text;
    taskArchive.taskthree=_task3.text;
    taskArchive.taskfour=_task4.text;
    
    NSMutableData *data=[[NSMutableData alloc]init];
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:taskArchive forKey:kDataKey];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

