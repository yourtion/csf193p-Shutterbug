//
//  JustPostedFlickrPhotosTVC.m
//  Shutterbug
//
//  Created by Yourtion on 14-1-21.
//  Copyright (c) 2014年 Yourtion. All rights reserved.
//

#import "JustPostedFlickrPhotosTVC.h"

@interface JustPostedFlickrPhotosTVC ()
@end

@implementation JustPostedFlickrPhotosTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self fetchPhotos];
}

-(IBAction)fetchPhotos
{
    [self.refreshControl beginRefreshing];
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
    dispatch_queue_t fetchQ = dispatch_queue_create("flick fetcher", NULL);
    dispatch_async(fetchQ, ^{
        NSData *jsonResults = [NSData dataWithContentsOfURL:url];
        NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];
        NSArray *photos = [propertyListResults valueForKey:@"photos"];
        NSArray *photoList = [photos valueForKeyPath:@"photo"];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.photos = photoList;
            [self.refreshControl endRefreshing];
        });
    });
    
}

@end
