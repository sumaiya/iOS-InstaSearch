//
//  ISMainViewController.h
//  InstaSearch
//
//  Created by Sumaiya Hashmi on 9/11/13.
//  Copyright (c) 2013 Sumaiya Hashmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISInstagramTagSearcher.h"

@interface ISMainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *queryField; //IBOutlet lets us hook this textfield up to the one in xib
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UIScrollView *searchResultsBox;
@property (strong, nonatomic) ISInstagramTagSearcher *searcher;

-(IBAction)didPressSearch:(id)sender;

@end
