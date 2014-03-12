//
//  FeedItemViewController.m
//  
//
//  Created by Michael Beattie on 3/6/14.
//
//

#import "FeedItemViewController.h"

@interface FeedItemViewController ()

@end

@implementation FeedItemViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    [self applyGradient];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/**
 * Takes in a feedItem and calls methods to update the view
 */
- (void)updateFeedItemInfo:(FeedItem *)feedItem
{
  [self updateFeedName:[feedItem getFeedName] andDate:[FeedItem convertDateToTimeAgo:feedItem.updatedAt]];
  [self updateFeedItemHeader:feedItem.title];
  [self updateFeedItemSmummary:feedItem.summary];
  [self updateFeedItemImage:feedItem.image];
}

/**
 * Format and set the text for the feedName label
 * Format: feedName • timeAgo
 */
- (void)updateFeedName:(NSString *)feedName andDate:(NSString *)timeAgo
{
  _feedName.text = [NSString stringWithFormat:@"%@ \u00b7 %@",feedName,timeAgo];
}

/**
 * Set the text for the headline label
 */
- (void)updateFeedItemHeader:(NSString *)title
{
  _feedItemHeadline.text = title;
}

/**
 * Set the text for the summary label
 */
- (void)updateFeedItemSmummary:(NSString *)summary
{
  _feedItemSummary.text = summary;
}

/**
 * Set the image resource for imageView
 */
- (void)updateFeedItemImage:(NSString *)image
{
  _feedItemImage.image = [UIImage imageNamed:image];
}

/**
 * Create and apply a gradient to the feedItem text area
 */
- (void)applyGradient
{
  // Create a new gradient object
  CAGradientLayer *gradient = [CAGradientLayer layer];
  
  // Set the dimensions equal to the info container
  gradient.frame = self.feedItemInfoContainer.bounds;
  
  // Define and set array of gradient colors
  UIColor *lightColor = [UIColor colorWithRed:39/255.0f green:42/255.0f blue:44/255.0f alpha:0.7f];
  UIColor *mediumColor = [UIColor colorWithRed:39/255.0f green:42/255.0f blue:44/255.0f alpha:0.9f];
  UIColor *darkColor = [UIColor colorWithRed:39/255.0f green:41/255.0f blue:45/255.0f alpha:1.0f];
  gradient.colors = [NSArray arrayWithObjects:(id)[lightColor CGColor],(id)[mediumColor CGColor],(id)[darkColor CGColor],nil];
  
  // Define and set array of color stop positions
  NSNumber *stopLight = [NSNumber numberWithFloat:0.05];
  NSNumber *stopMedium = [NSNumber numberWithFloat:0.10];
  NSNumber *stopDark = [NSNumber numberWithFloat:0.20];
  gradient.locations = [NSArray arrayWithObjects:stopLight, stopMedium, stopDark, nil];
  
  // Apply the gradient
  [self.feedItemInfoContainer.layer insertSublayer:gradient atIndex:0];
}

@end