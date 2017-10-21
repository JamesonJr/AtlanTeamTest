//
//  TableViewCell.m
//  AtlanTeamTest
//
//  Created by Eugenie Tyan on 21.10.17.
//  Copyright © 2017 Eugenie Tyan. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
@synthesize labelCell;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
