//
//  MADViewController.m
//  scrabbleQ
//
//  Created by Luis Alfredo Hierro on 10/22/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
{
    NSDictionary *words;
    NSArray *letters;

}




- (void)viewDidLoad
{
    [super viewDidLoad];
    NSBundle *bundle=[NSBundle mainBundle]; //returns bundle object
    NSString *plistPath=[bundle pathForResource:@"qwordswithoutu2" ofType:@"plist"];//retrieve the path of con
    NSDictionary *dictionary=[[NSDictionary alloc] initWithContentsOfFile:plistPath]; //loads the words of the plist file into the array
    words=dictionary;
    
    NSArray *array=[[words allKeys] sortedArrayUsingSelector:@selector(compare:)]; //grabs all the keys and sorted them to create an ordered array with all the values in alphabetical order
	letters=array;
    
    self.title=@"Words";//sets the title of the controller
	// Do any additional setup after loading the view, typically from a nib.
}

//Required methods for UITableViewDataSource
// Customize the number of rows in the section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *letter=[letters objectAtIndex:section]; //gets the letter for the choosen section
    NSArray *letterSection=[words objectForKey:letter]; //gets the words for that letter
    return [letterSection count]; //returns number of words in that section
}

//displays table view cells
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger section=[indexPath section]; //gets the section
    NSUInteger row=[indexPath row]; //gets the row
    NSString *letter=[letters objectAtIndex:section]; //gets the letter of the requested section
    NSArray *wordsSection=[words objectForKey:letter]; //gets the words for that section
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell
	cell.textLabel.text=[wordsSection objectAtIndex:row]; //sets the text of the cell with the row being requested
    return cell;

}

//UITableViewDelegate method that is called when a row is selected
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger section=[indexPath section]; //gets the section
    NSString *letter=[letters objectAtIndex:section]; //gets the letter of the requested section
    NSArray *wordsSection=[words objectForKey:letter]; //gets the words for that section
    
	NSString *rowValue=[wordsSection objectAtIndex:indexPath.row]; //sets the title of the selected row
    NSString *message=[[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    UIAlertView *alert=[[UIAlertView alloc]
                        initWithTitle:@"Row Selected" message:message delegate:nil cancelButtonTitle:@"Yes, I did" otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //deselects the row that had been choosen
}

//UITableViewDatasource method
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [letters count]; //each letter will be a section
}

//Sets the header value for each section
-(NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    NSString *letter=[letters objectAtIndex:section]; //gets the letter of the requested section
    return letter; //returns the letter as the header value
}

//adds a section index
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return letters;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
