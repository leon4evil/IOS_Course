//
//  PoemViewController.m
//  PoemHelper
//
//  Created by Luis Alfredo Hierro on 11/7/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "PoemViewController.h"
#import "rhymeViewController.h"

@interface PoemViewController ()

@end

@implementation PoemViewController{
    NSMutableArray *rhymes;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   
}

//NXMLParserDelegate methods. This is how we find the data we need in the xml file
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI  qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    // Read XML file and find "rhymes" ELEMENTS
    if ([elementName isEqualToString:@"rhymes"]) {
        
        self.rhymesString = [[NSMutableString alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    [self.rhymesString appendString:string]; //passing the value of the current element to the string
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"rhymes"]) {
        
        NSLog(@"%@", _rhymesString); 
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  
    if ([segue.identifier isEqualToString:@"rhymeSegue"]){
        
        
        //set up url string to pass to NXMLParser
        NSString *urlString = @"http://www.stands4.com/services/v2/rhymes.php?uid=3059&tokenid=atSvBverv00epQtY&term=";
        urlString = [urlString stringByAppendingString:_wordToRhyme.text];
        
        NSURL *url = [NSURL URLWithString:urlString];
        NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        xmlParser.delegate = self;
        [xmlParser parse];
        
        
        
        //these statements allow us to send data to rhymeViewController
        UINavigationController *nav = (UINavigationController*)segue.destinationViewController;
        rhymeViewController *foundRhymesViewController=[nav.viewControllers objectAtIndex:0];
        
        rhymes = [_rhymesString componentsSeparatedByString:@", "];//makes an array from string with many commas
        foundRhymesViewController.title=_wordToRhyme.text;
        foundRhymesViewController.poem = _poemTextView.text;
        foundRhymesViewController.rhymeList= rhymes;
    }
}
//Unwind Segue
-(IBAction)unwindRhyme:(UIStoryboardSegue *)segue{
    
    if([segue.identifier isEqualToString:@"doneSegue"]){
        rhymeViewController *source=[segue sourceViewController];
        _poemTextView.text = source.poem;
    }
}

//dismisses keyboard when user taps outside of text field or text view
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}



@end
