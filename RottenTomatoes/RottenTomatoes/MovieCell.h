//
//  MovieCell.h
//  RottenTomatoes
//
//  Created by Hemen Chhatbar on 6/6/14.
//  Copyright (c) 2014 Hemen Chhatbar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *postView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end
