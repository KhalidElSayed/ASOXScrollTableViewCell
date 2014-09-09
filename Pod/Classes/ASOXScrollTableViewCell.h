//
//  ASOXScrollTableViewCell.h
//  ASOXScrollTableViewCell
//
//  Created by Agus Soedibjo on 29/08/2014.
//  Copyright 2011 Agus Soedibjo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ASOXScrollTableViewCellDelegate;

@interface ASOXScrollTableViewCell : UITableViewCell

@property (strong, nonatomic) NSArray *contents;
@property (nonatomic) CGFloat contentViewCellWidth;
@property (nonatomic) CGFloat contentViewCellHeight;
@property (weak, nonatomic) id <ASOXScrollTableViewCellDelegate> delegate;

+ (NSString *)classReuseIdentifier;

- (id)initWithContentViewCellName:(NSString *)classString section:(NSUInteger)horizontalCellSection delegate:(id)object;

@end