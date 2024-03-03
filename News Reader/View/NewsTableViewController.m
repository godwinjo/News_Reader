//
//  NewsTableViewController.m
//  News Reader
//
//  Created by Godwin on 03/03/24.
//

#import "NewsTableViewController.h"
#import "NewsViewModel.h"
#import "NewsDataManager.h"
#import "NewsTableViewCell.h"


@interface NewsTableViewController ()

@property (nonatomic, strong) NewsViewModel *viewModel;

@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NewsDataManager *dataManager = [[NewsDataManager alloc] init];
    self.viewModel = [[NewsViewModel alloc] initWithDataProvider:dataManager];
    [self.viewModel fetchNewsWithCompletion:^(BOOL status) {
        if (status) {
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.newsArticles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell" forIndexPath:indexPath];
    NewsArticle *article = self.viewModel.newsArticles[indexPath.row];
    [cell setValues:article];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
