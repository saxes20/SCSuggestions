//
//  SCViewController.m
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import "SCViewController.h"
#import "Detail.h"
#import "Suggestion.h"

@interface SCViewController ()

@end

NSString *reviewString;
@implementation SCViewController

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // Custom the table
        
        // The className to query on
        //Must be same as class in parse
        self.parseClassName = @"Suggestion";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"name";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
        
        // The number of objects to show per page
        //self.objectsPerPage = 10;
    }
    return self;
}

@synthesize label1;
@synthesize label2;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ANY TIME YOU ADDOBSERVER, YOU HAVE TO REMOVE IT (removeObserver)
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshTable:)
                                                 name:@"refreshTableView"
                                               object:nil];
    
    
}

- (void)refreshTable:(NSNotification *) notification
{
    // Reload the recipes
    [self loadObjects];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"refreshTableView" object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    /*    if ([self.objects count] == 0) {
     query.cachePolicy = kPFCachePolicyCacheThenNetwork;
     }*/
    
    [query orderByAscending:@"review"];
    
    return query;
}



// Override to customize the look of a cell representing an object. The default is to display
// a UITableViewCellStyleDefault style cell with the label being the first key in the object.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *simpleTableIdentifier = @"SuggestionCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //takes name property and topic property from Suggestion class
    
    if([[object objectForKey:@"review"] isEqualToString:@"A"]) {
        NSString *name = [NSString stringWithFormat:@"%@", [object objectForKey:@"name"]];
        NSString *topic = [NSString stringWithFormat:@"Topic: %@", [object objectForKey:@"topic"]];
        
        cell.textLabel.text = name;
        cell.textLabel.textColor = [UIColor blueColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.5];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.detailTextLabel.text = topic;
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.5];
        cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
        cell.hidden = NO;
    }
    
    else {
        cell.hidden = YES;
    }
    
    NSLog(@"%@", [object objectForKey:@"review"]);
    reviewString = [object objectForKey:@"review"];
    return cell;
}

- (void) objectsDidLoad:(NSError *)error
{
    [super objectsDidLoad:error];
    
    NSLog(@"error: %@", [error localizedDescription]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        if ([segue.identifier isEqualToString:@"detailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Detail *destViewController = segue.destinationViewController;
        
        PFObject *object = [self.objects objectAtIndex:indexPath.row];
        Suggestion *suggestion = [[Suggestion alloc]init];
        suggestion.name = [object objectForKey:@"name"];
        suggestion.topic = [object objectForKey:@"topic"];
        suggestion.suggestion = [object objectForKey:@"suggestion"];
        destViewController.suggestion = suggestion;
        
        
    }
    
   
}



@end
