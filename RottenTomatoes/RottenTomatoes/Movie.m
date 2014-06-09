//
//  Movie.m
//  RottenTomatoes
//
//  Created by Hemen Chhatbar on 6/9/14.
//  Copyright (c) 2014 Hemen Chhatbar. All rights reserved.
//

#import "Movie.h"

@interface Movie()

@property NSDictionary *movie;
@property NSMutableArray *castMembers;

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *synopsis;

@property (strong, nonatomic) NSString *thumbUrl;
@property (strong, nonatomic) NSString *posterUrl;

@end

@implementation Movie

- (Movie *)initWithDictionary:(NSDictionary *)movie
{
	self = [super init];
    
	if (self) {
		self.movie = movie;
        
		[self setTitle:self.movie[@"title"]];
		[self setSynopsis:self.movie[@"synopsis"]];
		[self setThumbUrl:self.movie[@"posters"][@"profile"]];
		[self setPosterUrl:self.movie[@"posters"][@"original"]];
        
		self.castMembers = [[NSMutableArray alloc] init];
		for (NSDictionary *cast in self.movie[@"abridged_cast"]) {
			[self.castMembers addObject:cast[@"name"]];
		}
	}
    
	return self;
}

- (NSString *)castText
{
	return [self.castMembers componentsJoinedByString:@", "];
}

@end