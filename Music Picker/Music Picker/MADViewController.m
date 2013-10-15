//
//  MADViewController.m
//  Music Picker
//
//  Created by Luis Alfredo Hierro on 10/3/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array=[[NSArray alloc] initWithObjects:@"Country",@"pop",@"Rock",@"jazz", nil];
    
    _genre = array;
    NSArray *array2=[[NSArray alloc] initWithObjects:@"1980s",@"1960s", @"1970s" ,@"1850s",nil];
    _decade = array2;
    
}



//methods to implement the picker
//Required for UIPickerDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;//number of components
}

//Required for the UIPickerViewDataSource protocol
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component==0){
        return [_genre count];
    }
    else return [_decade count];
}
//Picker Delegate methods
//returns the title for a given row
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component==0){
        return [_genre objectAtIndex:row];
    }
    else return[_decade objectAtIndex:row];
}

//called when a row is selected
-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSInteger genrerow=[_musicPicker selectedRowInComponent:0]; //gets chosen row for the genre
    NSInteger decaderow=[_musicPicker selectedRowInComponent:1];//gets chosen row for the decade
    
    //writes the string with the rows's content to the label
    _choiceLabel.text=[NSString stringWithFormat:@"You Like %@ from the %@", [_genre objectAtIndex:genrerow],[_decade objectAtIndex:decaderow]];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
