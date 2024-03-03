//
//  NewsTableViewCell.h
//  News Reader
//
//  Created by Godwin on 03/03/24.
//

#import <UIKit/UIKit.h>
#import "NewsArticle.h"

@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
-(void)setValues:(NewsArticle*) news;

@end

