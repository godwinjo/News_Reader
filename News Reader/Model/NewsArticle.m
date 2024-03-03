//
//  NewsArticle.m
//  News Reader
//
//  Created by Godwin on 03/03/24.
//

#import "NewsArticle.h"
#import <Foundation/Foundation.h>

@implementation NewsArticle

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        [self parseFromDictionary:dictionary];
    }
    return self;
}

- (void)parseFromDictionary:(NSDictionary *)dictionary {
    self.title = dictionary[@"title"];
    
    // Convert the date string to NSDate
    NSString *dateString = dictionary[@"publishedDate"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    self.publishedDate = [dateFormatter dateFromString:dateString];
}

@end
