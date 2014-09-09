//
//  ASOXScrollUtility.m
//  ASOXScrollTableViewCell
//
//  Created by Agus Soedibjo on 05/09/2014.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import "ASOXScrollUtility.h"
#import "ASOXScrollTableViewCell.h"

@implementation ASOXScrollUtility

+ (ASOXScrollTableViewCell *)fillUpCell:(NSString *)classString withContents:(NSArray *)contents atSection:(NSUInteger)section delegate:(id)object {
    ASOXScrollTableViewCell *horizontalCellsBySection = [[ASOXScrollTableViewCell alloc] initWithContentViewCellName:classString section:section delegate:object];
    horizontalCellsBySection.contents = contents;
    
    return horizontalCellsBySection;
}


+ (ASOXScrollTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  withContents:(NSArray *)contents {
    static NSString *horizontalTableCellIdentifier = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        horizontalTableCellIdentifier = [ASOXScrollTableViewCell classReuseIdentifier];
    });
    
    ASOXScrollTableViewCell *cell = (ASOXScrollTableViewCell *)[tableView dequeueReusableCellWithIdentifier:horizontalTableCellIdentifier];
    if (cell == nil) {
        cell = [contents objectAtIndex:indexPath.section];
    }
    
    return cell;
}

@end
