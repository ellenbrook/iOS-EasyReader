//
//  EZRHomeWebViewDelegate.h
//  EasyReader
//
//  Created by Joseph Lorich on 4/7/14.
//  Copyright (c) 2014 Cloudspace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"

@class EZRHomeViewController;

/**
 * A delegate for the scroll view on the home view controller
 */
@interface EZRHomeWebViewDelegate : NJKWebViewProgress <UIScrollViewDelegate, NJKWebViewProgressDelegate>

/**
 * Initializes a new scroll view delegate for the given home view controller instance
 *
 * @param homeController The home view controller
 */
- (instancetype)initWithController:(EZRHomeViewController *)homeController;


@end
