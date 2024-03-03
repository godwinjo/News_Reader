//
//  NewsViewModel.m
//  News Reader
//
//  Created by Godwin on 03/03/24.
//

#import <Foundation/Foundation.h>
#import "NewsViewModel.h"

@interface NewsViewModel ()
@property (nonatomic, strong) id<NewsDataProvider> dataProvider;
@end

@implementation NewsViewModel

- (instancetype)initWithDataProvider:(id<NewsDataProvider>)dataProvider {
    self = [super init];
    if (self) {
        _dataProvider = dataProvider;
    }
    return self;
}

- (void)fetchNewsWithCompletion:(void (^)(BOOL))completion {
    [_dataProvider fetchNewsWithCompletion:^(NSArray<NewsArticle *> * _Nullable newsArticles, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"Error fetching news: %@", error.localizedDescription);
                if (completion) {
                    completion(NO);
                }
            } else {
                [self sortNewsByPublishedDate:newsArticles];
                if (completion) {
                    completion(YES);
                }
            }
        });
    }];
}

- (void)sortNewsByPublishedDate:(NSArray<NewsArticle *>*) newsArticles {
    self.newsArticles = [newsArticles sortedArrayUsingComparator:^NSComparisonResult(NewsArticle * _Nonnull article1, NewsArticle * _Nonnull article2) {
        return [article1.publishedDate compare:article2.publishedDate];
    }];
}

@end
