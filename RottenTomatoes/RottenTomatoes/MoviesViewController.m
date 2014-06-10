//
//  MoviesViewController.m
//  RottenTomatoes
//
//  Created by Hemen Chhatbar on 6/6/14.
//  Copyright (c) 2014 Hemen Chhatbar. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieDetailsViewController.h"
#import "MovieCell.h"
#import "Movie.h"
#import <UIImageView+AFNetworking.h>
#import "MBProgressHUD.h"



@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *movies;
@property (strong, nonatomic) MBProgressHUD *hud;
@property UIRefreshControl *refreshControl;

- (void)getMovies;
- (void)onRefresh:(id)sender;


@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    
    UITableViewController *tableViewController = [[UITableViewController alloc] init];
    tableViewController.tableView = self.tableView;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onRefresh:) forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    
    tableViewController.refreshControl = self.refreshControl;
  //  [self.tableView addSubview:refreshControl];
    
    
    [self getMovies];
 
   
}

- (void)onRefresh:(id)sender
{
    [self getMovies];
    [self.refreshControl endRefreshing];
    
}

-(void)getMovies{

    self.hud = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    [self.hud setDimBackground:YES];
    
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", object);
        
        self.movies = object[@"movies"];
        
        [self.tableView reloadData];
    }];
    
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 130;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier: @"MovieCell"];
    
    [self.tableView setDelegate:self];
    //[self.hud hide:YES];
    [self.hud hide:YES afterDelay:1.0];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.movies.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    MovieCell *movieCell = [tableView dequeueReusableCellWithIdentifier: @"MovieCell"];
    
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    NSDictionary *movie = self.movies[indexPath.row];
    
    movieCell.titleLabel.text = movie[@"title"];
    movieCell.synopsisLabel.text = movie[@"synopsis"];
    
   
    
    NSDictionary *moviePosters = movie[@"posters"];
     NSLog(@"%@", moviePosters[@"detailed"]);
    
    //NSURL   *imageURL   = [NSURL URLWithString:moviePosters[@"profile"]];
    //NSData  *imageData  = [NSData dataWithContentsOfURL:imageURL];
    //UIImage *image      = [UIImage imageWithData:imageData];

    //movieCell.postView.image = image;
    
    //Asynchronously load the image
    NSURL   *imageURL   = [NSURL URLWithString:moviePosters[@"profile"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:imageURL];
     UIImage *placeholderImage = [UIImage imageNamed:@"movie_placeholder.jpeg"];
    
     __weak UITableViewCell *weakCell = movieCell;
    
    [movieCell.imageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakCell.imageView.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
    
    return movieCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *selMovie = [self.movies objectAtIndex:indexPath.row];
   
    //Movie *selectedMovie = [[Movie alloc] initWithDictionary:selMovie];
    
    //selectedMovie = [self.movies objectAtIndex:indexPath.row];
    //selectedMovie.title = selMovie[@"title"];
    
    NSLog(@"%@", selMovie[@"title"]);
    
    //NSDictionary *moviePosters = selectedMovie[@"posters"];
    //NSLog(@"%@", moviePosters[@"detailed"]);
    
    //NSURL   *imageURL   = [NSURL URLWithString:moviePosters[@"profile"]];
    //NSData  *imageData  = [NSData dataWithContentsOfURL:imageURL];
    //UIImage *image      = [UIImage imageWithData:imageData];
    
    
    MovieDetailsViewController *detailsViewController = [[MovieDetailsViewController alloc]                                                        initWithNibName:@"MovieDetailsViewController" bundle:nil];
    
   
    
        [self.navigationController pushViewController:detailsViewController animated:YES];
    
     detailsViewController.movieTitle = selMovie[@"title"];
   
//    movieCell.postView.image = image;
    
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
   // NSString *cellText = cell.textLabel.text;
 
    /*MovieCell *cell = (MovieCell *) [tableView cellForRowAtIndexPath:indexPath];
    

    NSLog(@"%@", cell.titleLabel);
    
    MovieDetailsViewController *detailsViewController = [[MovieDetailsViewController alloc]
                                                         initWithNibName:@"MovieDetailsViewController" bundle:nil];
    [self.navigationController pushViewController:detailsViewController animated:YES];*/
    
}

/*- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
    
    
    MovieDetailsViewController *detailsViewController = [[MovieDetailsViewController alloc]
                                                    initWithNibName:@"MovieDetailsViewController" bundle:nil];
    [self.navigationController pushViewController:detailsViewController animated:YES];

//    [detailsViewController release];
}*/

@end
