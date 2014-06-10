//
//  MovieDetailsViewController.m
//  RottenTomatoes
//
//  Created by Hemen Chhatbar on 6/8/14.
//  Copyright (c) 2014 Hemen Chhatbar. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "Movie.h"

@interface MovieDetailsViewController ()




@end

@implementation MovieDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.titleLabel.text = @"TTTTTT";
        self.synopsisLable.text =@"synopsis....";
        self.ratingsLable.text = @"ratings...";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.posterView = self.recipe.name;
	self.titleLabel.text = @"TTTTTT";
    self.synopsisLable.text = self.movieTitle;
    self.ratingsLable.text = @"ratings...";
    //self.movieTitle;
    NSLog(@"viewDidLoad");
    
     NSLog(@"%@", self.movieTitle);
    
	//self.instructionsTextView.text = self.recipe.instructions;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear");
    
    
    //self.titleLable.text = @"PPPPP";
    //self.synopsisLable.text =@"synopsis....";
    //self.ratingsLable.text = @"ratings...";
    //self.movieTitle;
    
    NSLog(@"%@", self.movieTitle);
    
}
@end
