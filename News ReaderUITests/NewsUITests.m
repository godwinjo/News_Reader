//
//  NewsUITests.m
//  News ReaderUITests
//
//  Created by Godwin on 04/03/24.
//

#import <XCTest/XCTest.h>

@interface NewsUITests : XCTestCase

@property (nonatomic, strong) XCUIApplication *app;

@end

@implementation NewsUITests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    self.app = [[XCUIApplication alloc] init];
    [self.app launch];
}

- (void)tearDown {
    _app = nil;
    [super tearDown];

}

- (void)testNewsTable {
    XCUIElement *newsTable = self.app.tables[@"NewsTable"];
    XCTAssertTrue(newsTable.exists, @"News table view does not exist");
}

- (void)testNewsCell {
    XCUIElement *newsTable = self.app.tables[@"NewsTable"];
    
    NSArray<XCUIElement *> *cells = newsTable.cells.allElementsBoundByIndex;
    XCTAssertTrue(cells.count > 0, @"No cells found in the news table");

    XCUIElement *firstCell = cells[0];
    XCTAssertTrue(firstCell.exists, @"First cell does not exist");
}

- (void)testNewsTitleLabel {
    XCUIElement *newsTable = self.app.tables[@"NewsTable"];
    NSArray<XCUIElement *> *cells = newsTable.cells.allElementsBoundByIndex;
    
    for (XCUIElement *cell in cells) {
        XCUIElement *titleLabel = cell.staticTexts[@"NewsTitleLabel"];
        XCTAssertTrue(titleLabel.exists, @"Title label does not exist in cell");
    }
}

- (void)testNewsDateLabel {
    XCUIElement *newsTable = self.app.tables[@"NewsTable"];
    NSArray<XCUIElement *> *cells = newsTable.cells.allElementsBoundByIndex;
    
    for (XCUIElement *cell in cells) {
        XCUIElement *dateLabel = cell.staticTexts[@"NewsDateLabel"];
        XCTAssertTrue(dateLabel.exists, @"Date label does not exist in cell");
    }
}

@end
