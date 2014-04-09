//
//  CSMenuUserFeedDataSource.m
//  EasyReader
//
//  Created by Michael Beattie on 3/20/14.
//  Copyright (c) 2014 Cloudspace. All rights reserved.
//

#import "EZRMenuUserFeedDataSource.h"

#import "UIColor+EZRSharedColorAdditions.h"

#import "EZRMenuFeedCell.h"

#import "Feed.h"
#import "FeedItem.h"
#import "User.h"

#import "EZRMenuViewController.h"

@implementation EZRMenuUserFeedDataSource
{
    /// The menu view controller
    EZRMenuViewController *controller;
}

/**
 * Sets each instance variable to the values in the given parameters
 */
- (instancetype)initWithController:(EZRMenuViewController *)menuController
{
    self = [super init];
    
    if (self) {
        _feeds = [[NSMutableSet alloc] init];
        _sortedFeeds = [[NSArray alloc] init];
        controller = menuController;
    }
    
    return self;
}

/**
 * Sets the feeds to those in the database
 */
- (void)updateWithFeeds:(NSMutableSet *)feeds
{
    self.feeds = feeds;
    [self sortFeeds];
}

/**
 * Sort the feeds alphabetically
 */
- (void)sortFeeds
{
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    _sortedFeeds = [[NSArray arrayWithArray:[_feeds allObjects]] sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
}


#pragma mark - Count Methods
/**
 * Determines the number of rows in each section
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sortedFeeds count];
}


#pragma mark - Size Methods
/**
 * Height of the header in each section
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

/**
 * Height of all the cells
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}


#pragma mark - Cell View
/**
 * Generates a cell for a given index path
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Dequeue a styled cell
    EZRMenuFeedCell *cell = (EZRMenuFeedCell *)[tableView dequeueReusableCellWithIdentifier:@"UserFeedCell"];
    
    // Get the feed
    Feed *feed = [self.sortedFeeds objectAtIndex:indexPath.row];
    
    // Set the cell data
    [self setFeed:feed forUserFeedCell:cell];
    return cell;
}

/**
 * Set the feed for a user cell
 */
- (void)setFeed:(Feed *)feed forUserFeedCell:(EZRMenuFeedCell *)cell
{
    cell.feed = feed;
    
    [self setSelectedBackgroundForCell:cell];
}

/**
 * Set the selectedBackgroundView for a cell
 */
- (void)setSelectedBackgroundForCell:(UITableViewCell *)cell
{
    UIView *selectedBackgroundView = [[UIView alloc] init];
    [selectedBackgroundView setBackgroundColor: [UIColor EZR_charcoal]];
    cell.selectedBackgroundView = selectedBackgroundView;
}

/**
 * Commits each editing action
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Feed *toDelete = [self.sortedFeeds objectAtIndex:indexPath.row];
        
        [[User current] removeFeedsObject:toDelete];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        [controller.tableView_menu reloadData];
    }
}

/**
 * Determines the editing style for each row
 */
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( indexPath.row == [self.sortedFeeds count] ) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}

@end