//
//  NewsTableViewCell.m
//  News Reader
//
//  Created by Godwin on 03/03/24.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setValues:(NewsArticle*) news {
    self.labelTitle.text = news.title;
    self.labelDate.text = [NSString stringWithFormat:@"%@", news.publishedDate];
}

@end
