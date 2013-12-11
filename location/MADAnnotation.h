//
//  MADAnnotation.h
//  location
//
//  Created by Luis Alfredo Hierro on 11/21/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>




@interface MADAnnotation : NSObject <MKAnnotation>
@property (nonatomic, readonly)CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly)NSString *title;
@property (nonatomic,copy)NSString *subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coor;
-(void)moveAnnotation:(CLLocationCoordinate2D) newCoordinate;

@end
