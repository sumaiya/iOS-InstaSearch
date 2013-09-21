//
//  ISMainViewController.m
//  InstaSearch
//
//  Created by Sumaiya Hashmi on 9/11/13.
//  Copyright (c) 2013 Sumaiya Hashmi. All rights reserved.
//

#import "ISMainViewController.h"
#import "INETImageView.h"
#import <QuartzCore/QuartzCore.h>

@interface ISMainViewController ()

@end

@implementation ISMainViewController

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
   self.searcher = [[ISInstagramTagSearcher alloc] initWithTagQuery:[self queryField].text andTarget:self andAction:@selector(handleInstagramData:)];
}

- (void)handleInstagramData:(NSMutableDictionary *)data {
    NSMutableArray *photos = [data objectForKey:@"data"];
    
    for (UIView *subView in [self.searchResultsBox subviews]) {
        [subView removeFromSuperview];
    }
    
    [self.searchResultsBox setContentSize:CGSizeMake(320,100*[photos count])];
    int i = 0;

    for (NSMutableDictionary *photo in photos) {
        INETImageView* temp = [[INETImageView alloc] initWithURL:[NSURL URLWithString:[[[photo objectForKey:@"images"] objectForKey:@"thumbnail"] objectForKey:@"url"]] andFrame:CGRectMake(0, 150*i, 188, 150)];
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
