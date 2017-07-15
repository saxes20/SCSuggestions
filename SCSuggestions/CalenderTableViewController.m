//
//  CalenderTableViewController.m
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import "CalenderTableViewController.h"
#import "CalenderDetailVC.h"
#import "Calender.h"

@interface CalenderTableViewController ()

@end

int loaded;
@implementation CalenderTableViewController

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // Custom the table
        
        // The className to query on
        //Must be same as class in parse
        self.parseClassName = @"Calender";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"event";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
        
        // The number of objects to show per page
        //self.objectsPerPage = 10;
    }
    return self;
}

-(void) viewDidDisappear:(BOOL)animated {
    //NSLog(@"disappeared");
    loaded = 0;
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    //ANY TIME YOU ADDOBSERVER, YOU HAVE TO REMOVE IT (removeObserver)
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(refreshTable:)
//                                                 name:@"refreshTableView"
//                                               object:nil];
//}
//
//- (void)refreshTable:(NSNotification *) notification
//{
//    // Reload the recipes
//    [self loadObjects];
//}
//
//
//- (void)viewDidUnload
//{
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//    
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"refreshTableView" object:nil];
//}

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
    
    [query orderByAscending:@"order"];
    
    return query;
}



// Override to customize the look of a cell representing an object. The default is to display
// a UITableViewCellStyleDefault style cell with the label being the first key in the object.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    loaded++;
    //NSLog(@"%d", loaded);
    static NSString *simpleTableIdentifier = @"CalenderCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //takes name property and topic property from Suggestion class
    NSString *cellTitle = [NSString stringWithFormat:@"%@", [object objectForKey:@"event"]];
    NSString *cellTitle2 = [NSString stringWithFormat:@"%@ %@", [object objectForKey:@"month"], [object objectForKey:@"date"]];
    

    
    
    cell.detailTextLabel.text = cellTitle;
//    UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
//    [cell.textLabel setFont:boldFont];
    if([[object objectForKey:@"upcoming"] isEqualToString:@"YES"]) {
        cell.detailTextLabel.textColor = [UIColor blueColor];
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    }
    else {
        cell.detailTextLabel.textColor = [UIColor blackColor];
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    }
    
    cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
    cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.textLabel.text = cellTitle2;
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    
    //NSLog(@"%@", [object objectForKey:@"event"]);
    
    
    
    return cell;
}

- (void) objectsDidLoad:(NSError *)error
{
    [super objectsDidLoad:error];
    
    NSLog(@"error: %@", [error localizedDescription]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailSegue2"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CalenderDetailVC *destViewController = segue.destinationViewController;
        PFObject *object = [self.objects objectAtIndex:indexPath.row];
        Calender *calender = [[Calender alloc]init];
        calender.event = [object objectForKey:@"event"];
       calender.month = [object objectForKey:@"month"];
        calender.date = [object objectForKey:@"date"];
        calender.eventDetails = [object objectForKey:@"eventDetails"];
        calender.upcoming = [object objectForKey:@"upcoming"];
        destViewController.calender = calender;

    }
}



- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
