//
//  MADViewController.m
//  countriesb
//
//  Created by Luis Alfredo Hierro on 10/24/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADViewController.h"
#import "DetailViewController.h"
#import "ContinentInfoViewController.h"

@interface MADViewController (){
    NSMutableDictionary *continentData;

}

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle=[NSBundle mainBundle];//returns bundle object
    NSString *plistPath=[bundle pathForResource:@"continents" ofType:@"plist"];//retrieve the path of continents.plist
    NSMutableDictionary *dictionary=[[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];//loads the contents of the plist file into a dictionary
    //the dictionary uses the continents as the keys and  NSArray with the countries for each contint
    continentData=dictionary;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [continentData count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSArray *rowData=[continentData allKeys];//creates an array with all keys from our dicctionary
    cell.textLabel.text=[rowData objectAtIndex:indexPath.row];//sets the text of the cell with the row being requested
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"countrysegue"]){
        DetailViewController *countryViewController=segue.destinationViewController;
        
        NSIndexPath *indexPath=[self.tableView indexPathForCell:sender];//changed for detail disclosure
        NSArray *rowData=[continentData allKeys]; //creates an array our dicctionary
        countryViewController.title=[rowData objectAtIndex:indexPath.row];
        countryViewController.countryList=[continentData objectForKey:countryViewController.title];
    }
    if ([segue.identifier isEqualToString:@"continentsegue"]) {
        ContinentInfoViewController *infoViewController=segue.destinationViewController;
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        NSArray *rowData=[continentData allKeys];
        infoViewController.name=[rowData objectAtIndex:indexPath.row];
        infoViewController.number=[NSString stringWithFormat:@"%d", [[continentData objectForKey:infoViewController.name] count]];
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
