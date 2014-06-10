//
//  MovieDetailsViewController.h
//  RottenTomatoes
//
//  Created by Hemen Chhatbar on 6/8/14.
//  Copyright (c) 2014 Hemen Chhatbar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailsViewController : UIViewController


@property (nonatomic, retain) NSString* movieTitle;


@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *ratingsLable;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLable;

@end
