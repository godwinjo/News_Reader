//
//  MockNewsDataProvider.m
//  News ReaderTests
//
//  Created by Godwin on 03/03/24.
//

#import <Foundation/Foundation.h>
#import "NewsDataProvider.h"
#import "NewsArticle.h"

@interface MockNewsDataProvider : NSObject <NewsDataProvider>
@property (nonatomic, copy) NSArray<NewsArticle *> *mockedNewsArticles;
@property (nonatomic, strong) NSError *mockedError;
@end

@implementation MockNewsDataProvider : NSObject 
- (void)fetchNewsWithCompletion:(void (^)(NSArray<NewsArticle *> * _Nullable, NSError * _Nullable))completion {
    if (self.mockedNewsArticles) {
        completion(self.mockedNewsArticles, nil);
    } else {
        completion(nil, self.mockedError);
    }
}

@end
