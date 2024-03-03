//
//  NewsViewModelTests.m
//  News ReaderTests
//
//  Created by Godwin on 03/03/24.
//

#import <XCTest/XCTest.h>
#import "NewsViewModel.h"
#import "MockNewsDataProvider.h"

@interface NewsViewModelTests : XCTestCase

@property (nonatomic, strong) NewsViewModel *viewModel;
@property (nonatomic, strong) MockNewsDataProvider *mockDataProvider;

@end

@implementation NewsViewModelTests

- (void)setUp {
    self.mockDataProvider = [[MockNewsDataProvider alloc] init];
    self.viewModel = [[NewsViewModel alloc] initWithDataProvider: self.mockDataProvider];
}

- (void)tearDown {
    self.mockDataProvider = nil;
    self.viewModel = nil;
    [super tearDown];
}

- (void)testFetchNewsSuccess {
    // Given
    NSDictionary *dict = @{@"title": @"Lorem Ipsum",
                           @"publishedDate": @"2023-05-15T08:00:00Z"};
    NewsArticle *article = [[NewsArticle alloc] initWithDictionary:dict];
    NSArray<NewsArticle *> *mockedArticles = @[article];
    self.mockDataProvider.mockedNewsArticles = mockedArticles;
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch News Expectation"];
    
    // When
    [self.viewModel fetchNewsWithCompletion:^(BOOL success) {
        // Then
        XCTAssertTrue(success);
        XCTAssertEqual(self.viewModel.newsArticles, mockedArticles);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

- (void)testFetchNewsFailure {
    // Given
    NSError *mockedError = [NSError errorWithDomain:@"TestDomain" code:123 userInfo:nil];
    self.mockDataProvider.mockedError = mockedError;
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch News Expectation"];
    
    // When
    [self.viewModel fetchNewsWithCompletion:^(BOOL success) {
        // Then
        XCTAssertFalse(success);
        XCTAssertNil(self.viewModel.newsArticles);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

@end
