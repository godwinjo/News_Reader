//
//  NewsArticle.h
//  News Reader
//
//  Created by Godwin on 03/03/24.
//

#import <Foundation/Foundation.h>

@interface NewsArticle : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *publishedDate;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
