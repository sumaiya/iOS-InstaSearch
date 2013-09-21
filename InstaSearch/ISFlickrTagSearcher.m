//
//  ISFlickrTagSearcher.m
//  InstaSearch
//
//  Created by Sumaiya Hashmi on 9/19/13.
//  Copyright (c) 2013 Sumaiya Hashmi. All rights reserved.
//

#import "ISFlickrTagSearcher.h"

@implementation ISFlickrTagSearcher

- (id)initWithTagQuery:(NSString *)query andTarget:(id)incomingTarget andAction:(SEL)incomingAction;
{
    self = [super init];
    // assemble url to access api
    NSString* url = [NSString stringWithFormat: @"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=7a5959f71c12c8b6f430bf02723a51b0&tags=%@&per_page=20&format=json&nojsoncallback=1", query];
    if (self) {
        self.connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] delegate:self];
        // connect to url
        self.target = incomingTarget;
        self.action = incomingAction;
    }
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.data = [[NSMutableData alloc] initWithCapacity:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.data appendData:data];
    // collect data from connection
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSMutableDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:nil];
    // read self.data JSON into a dictionary
    
    [self.target performSelector:self.action withObject:dictionary];
    // call action on target with args dictionary
}


@end
