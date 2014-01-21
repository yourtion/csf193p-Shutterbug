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

-(void)fetchPhotos
{
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
    NSData *jsonResults = [NSData dataWithContentsOfURL:url];
    //NSLog(@"%@", url);
    NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults
                                                                        options:0
                                                                          error:NULL];
    //NSLog(@"%@", propertyListResults);
    NSArray *photos = [propertyListResults valueForKey:@"photos"];
    NSArray *photoList = [photos valueForKeyPath:@"photo"];
    self.photos = photoList;
    NSLog(@"%@", photoList);
    
}

@end
