//
//  MADArchive.h
//  Task
//
//  Created by Luis Alfredo Hierro on 12/3/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MADArchive : NSObject<NSCoding,NSCopying>
@property(copy, nonatomic)NSString *taskone;
@property(copy, nonatomic)NSString *tasktwo;
@property(copy, nonatomic)NSString *taskthree;
@property(copy, nonatomic)NSString *taskfour;


@end
