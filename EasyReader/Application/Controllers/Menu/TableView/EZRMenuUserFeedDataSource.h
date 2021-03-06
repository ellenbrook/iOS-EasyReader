//
//  CSMenuUserFeedDataSource.h
//  EasyReader
//
//  Created by Michael Beattie on 3/20/14.
//  Copyright (c) 2014 Cloudspace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLDArrayTableViewDataSource.h"

@class User;

/**
 * A UITableViewDataSource for feeds in Core Data
 */
@interface EZRMenuUserFeedDataSource : CLDArrayTableViewDataSource

/// Feeds used to populate the menu table
@property (nonatomic, retain) NSMutableSet *feeds;


@end