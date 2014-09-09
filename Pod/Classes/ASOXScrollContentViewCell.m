//
//  ASOXScrollContentViewCell.m
//  ASOXScrollTableViewCell
//
//  Created by Agus Soedibjo on 02/09/2014.
//
//

#import "ASOXScrollContentViewCell.h"

@implementation ASOXScrollContentViewCell

- (void)awakeFromNib {
# warning Don't forget to call [super awakeFromNib] in method (void)awakeFromNib of it's subclass. Ignore this warning if you have done it.
    
    // Initialization code
    self.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
