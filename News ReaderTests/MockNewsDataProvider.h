//
//  MockNewsDataProvider.h
//  News Reader
//
//  Created by Godwin on 03/03/24.
//

#import <Foundation/Foundation.h>
#import "NewsDataProvider.h"
#import "NewsArticle.h"

@interface MockNewsDataProvider : NSObject
@property (nonatomic, copy) NSArray<NewsArticle *> *mockedNewsArticles;
@property (nonatomic, strong) NSError *mockedError;
@end
