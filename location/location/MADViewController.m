//
//  MADViewController.m
//  location
//
//  Created by Luis Alfredo Hierro on 11/21/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADViewController.h"
#import "MADAnnotation.h"

@interface MADViewController ()

@end

@implementation MADViewController{
    CLLocationManager *locationManager;
    MADAnnotation *annotation;


}

- (void)viewDidLoad
{
    
    
    locationManager=[[CLLocationManager alloc]init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    
    _mapView.delegate = self;
    _mapView.mapType = MKMapTypeHybrid;
    
    
    
    
    [super viewDidLoad];
    
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    

    
    // Dispose of any resources that can be recreated.
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{

    _latitudeLabel.text=[[NSString alloc] initWithFormat:@"%f",manager.location.coordinate.latitude];//assign the latitude as a string to the text field
    _longitudeLabel.text = [[NSString alloc] initWithFormat:@"%f",manager.location.coordinate.longitude];
    _alitudeLabel.text = [[NSString alloc] initWithFormat:@"%f",manager.location.altitude];
    _accuracyLabel.text = [[NSString alloc] initWithFormat:@"%f",manager.location.horizontalAccuracy];
    
    MKCoordinateSpan span;
    span.latitudeDelta=.001;
    span.longitudeDelta=.001;
    MKCoordinateRegion region;
    region.center =manager.location.coordinate;
    region.span=span;
    [_mapView setRegion:region animated:YES];
    
    //diplay annotation
    if(annotation){
        [annotation moveAnnotation:manager.location.coordinate];//moves the anotation if it already exists
    
    
    }
    else{//creates an annotation if one does not exist
        annotation=[[MADAnnotation alloc]
                    initWithCoordinate:manager.location.coordinate];//creates new annotation
        [_mapView addAnnotation:annotation];
    
    
    }
    

}
//called when a location cannot be determined
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString *errorType;
    if(error.code == kCLErrorDenied){
        errorType=@"access denied ";
        
    }else errorType=@"error";
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Error" message:errorType delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [alert show];




}


@end
