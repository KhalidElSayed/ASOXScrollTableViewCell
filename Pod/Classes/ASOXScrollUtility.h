//
//  ASOXScrollUtility.h
//  ASOXScrollTableViewCell
//
//  Created by Agus Soedibjo on 05/09/2014.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASOXScrollTableViewCell;

@interface ASOXScrollUtility : NSObject

+ (ASOXScrollTableViewCell *)fillUpCell:(NSString *)classString withContents:(NSArray *)contents atSection:(NSUInteger)section delegate:(id)object;

+ (ASOXScrollTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  withContents:(NSArray *)contents;

@end