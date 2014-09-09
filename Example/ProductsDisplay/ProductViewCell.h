//
//  ProductViewCell.h
//  SHProto
//
//  Created by Agus Soedibjo on 28/08/2014.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASOXScrollContentViewCell.h"

@interface ProductViewCell : ASOXScrollContentViewCell

@property (strong, nonatomic) IBOutlet UIImageView *thumbnail;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *price;

@end
