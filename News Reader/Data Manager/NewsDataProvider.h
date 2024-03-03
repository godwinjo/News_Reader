//
//  NewsDataProvider.h
//  News Reader
//
//  Created by Godwin on 03/03/24.
//

#import "NewsArticle.h"
#import <Foundation/Foundation.h>

@protocol NewsDataProvider <NSObject>
- (void)fetchNewsWithCompletion:(void (^_Nullable)(NSArray<NewsArticle *> * _Nullable newsArticles, NSError * _Nullable error))completion;
@end
