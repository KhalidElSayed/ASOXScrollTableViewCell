//
//  ASOXScrollTableViewCellDelegate.h
//  ASOXScrollTableViewCell
//
//  Created by Agus Soedibjo on 01/09/2014.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ASOXScrollTableViewCellDelegate <NSObject>

@required

- (UITableViewCell *)horizontalScrollTableView:(UITableView *)tableView cellForRow:(NSUInteger)row atSection:(NSUInteger)section;

@optional

- (void)horizontalScrollTableView:(UITableView *)tableView didSelectRow:(NSUInteger)row atSection:(NSUInteger)section;

@end
