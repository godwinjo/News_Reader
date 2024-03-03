//
//  DataManager.m
//  News Reader
//
//  Created by Godwin on 03/03/24.
//

#import <Foundation/Foundation.h>
#import "NewsArticle.h"
#import "NewsDataManager.h"

@implementation NewsDataManager

- (void)fetchNewsWithCompletion:(void (^ _Nullable)(NSArray<NewsArticle *> * _Nullable, NSError * _Nullable))completion { 
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Read news from JSON file asynchronously
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
        
        if (jsonData) {
            NSError *error;
            NSArray *jsonDict= [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
            
            if (!error && [jsonDict isKindOfClass:[NSDictionary class]]) {
                NSMutableArray<NewsArticle *> *newsArticles = [NSMutableArray array];
                NSArray *jsonArray = [jsonDict valueForKey:@"news"];
                for (NSDictionary *item in jsonArray) {
                    NewsArticle *article = [[NewsArticle alloc] initWithDictionary:item];
                    [newsArticles addObject:article];
                }
                if (completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion([newsArticles copy], nil);
                    });
                }
            } else {
                if (completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(nil, error);
                    });
                }
            }
        } else {
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSError *fileError = [NSError errorWithDomain:@"NewsDataManagerErrorDomain" code:-1 userInfo:@{NSLocalizedDescriptionKey: @"Error reading file 'news.json'"}];
                    completion(nil, fileError);
                });
            }
        }
    });
}

@end
