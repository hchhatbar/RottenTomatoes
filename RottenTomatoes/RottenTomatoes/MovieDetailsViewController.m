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
        
        //self.titleLabel.text = @"TTTTTT";
        //self.synopsisLable.text =@"synopsis....";
        //self.ratingsLable.text = @"ratings...";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.posterView = self.recipe.name;
	
    self.synopsisLable.text = self.synopsis;
    self.ratingsLable.text = self.movieTitle;
    //self.titleLabel.text = self.movieTitle;
    
    //self.movieTitle;
    NSLog(@"imageURL");
    
     NSLog(@"%@", self.imageURL);
    
    NSURL   *image   = [NSURL URLWithString:self.imageURL];
    NSData * imageData = [NSData dataWithContentsOfURL:image];
    UIImage *img = [UIImage imageWithData:imageData];
    
    self.posterView.image = img;
  
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
