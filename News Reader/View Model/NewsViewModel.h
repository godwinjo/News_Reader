//
//  NewsViewModel.h
//  News Reader
//
//  Created by Godwin on 03/03/24.
//

#import <Foundation/Foundation.h>
#import "NewsDataProvider.h"
#import "NewsArticle.h"

@interface NewsViewModel : NSObject
@property (nonatomic, strong) NSArray<NewsArticle *> *newsArticles;
- (instancetype)initWithDataProvider:(id<NewsDataProvider>)dataProvider;
- (void)fetchNewsWithCompletion:(void (^) (BOOL status))completion;
@end
