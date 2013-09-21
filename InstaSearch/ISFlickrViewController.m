//
//  ISFlickrViewController.m
//  InstaSearch
//
//  Created by Sumaiya Hashmi on 9/19/13.
//  Copyright (c) 2013 Sumaiya Hashmi. All rights reserved.
//

#import "ISFlickrViewController.h"
#import "INETImageView.h"
#import <QuartzCore/QuartzCore.h>

@interface ISFlickrViewController ()

@end


@implementation ISFlickrViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField //close keyboard on Return
{
    [self.queryField resignFirstResponder];
    return TRUE;
}

-(IBAction)didPressSearch:(id)sender //
{
    if ([self.queryField isFirstResponder])
    {
        [self.queryField resignFirstResponder]; //dismiss keyboard if not already
    }
    
    //set up tag searcher
    self.searcher = [[ISFlickrTagSearcher alloc] initWithTagQuery:[self queryField].text andTarget:self andAction:@selector(handleFlickrData:)];
}

- (void)handleFlickrData:(NSMutableDictionary *)data {
    NSMutableArray *photos = [[data objectForKey:@"photos"] objectForKey:@"photo"];
    
    [self.searchResultsBox setContentSize:CGSizeMake(320,100*[photos count])];
    int i = 0;
    
    // iterate through array of photo dictionaries
    for (NSMutableDictionary *photo in photos) {
        // assemble photo url from farm, server, id, and secrets
        NSString *photoUrl = [NSString stringWithFormat:@"http://farm%@.staticflickr.com/%@/%@_%@.jpg", [photo objectForKey:@"farm"], [photo objectForKey:@"server"], [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];

        // add photo to scrollView via an imageView
        INETImageView* temp = [[INETImageView alloc] initWithURL:[NSURL URLWithString:photoUrl] andFrame:CGRectMake(0, 150*i, 188, 150)];
        [self.searchResultsBox addSubview:temp];
        i++;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil //constructor
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
    // Do any additional setup after loading the view from its nib.
    _searchResultsBox.layer.borderWidth = 2;
    _searchResultsBox.layer.borderColor = [UIColor blackColor].CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // disable horizontal scrolling
    if (sender.contentOffset.x != 0) {
        CGPoint offset = sender.contentOffset;
        offset.x = 0;
        sender.contentOffset = offset;
    }
}

@end
