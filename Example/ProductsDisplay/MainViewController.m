//
//  MainViewController.m
//  SHProto
//
//  Created by Agus Soedibjo on 29/08/2014.
//  Copyright 2011 Agus Soedibjo. All rights reserved.
//

#import "MainViewController.h"
#import "ASOXScrollUtility.h"
#import "ASOXScrollTableViewCell.h"
#import "ASOXScrollTableViewCellDelegate.h"
#import "ProductViewCell.h"
#import "ProductsInCategory.h"

@interface MainViewController () <ASOXScrollTableViewCellDelegate>

@property (strong, nonatomic) NSMutableArray *horizontalScrollElements;
@property (strong, nonatomic) NSMutableArray *productsInCategories;

@end

@implementation MainViewController

#pragma mark - Template methods

- (void)viewDidLoad
{
    if (!self.horizontalScrollElements) {
        NSString *mainProductsPath = [[NSBundle mainBundle] pathForResource:@"MainProducts" ofType:@"json"];
        NSData *mainProductsData = [[NSData alloc] initWithContentsOfFile:mainProductsPath];
        
        NSError *error = nil;
        id mainProductsJson = [NSJSONSerialization JSONObjectWithData:mainProductsData options:NSJSONReadingAllowFragments error:&error];
        
        NSDictionary *deserializedMainProductsDict = (NSDictionary *)mainProductsJson;
        NSArray *productsByCategories = [deserializedMainProductsDict valueForKey:@"results"];
        
        self.horizontalScrollElements = [NSMutableArray new];
        self.productsInCategories = [NSMutableArray new];
        for (int8_t i = 0; i < [productsByCategories count]; i++) {
            ProductsInCategory *productsInCategory = [ProductsInCategory new];
            productsInCategory.category = [[productsByCategories objectAtIndex:i] valueForKey:@"category"];
            productsInCategory.products = [[productsByCategories objectAtIndex:i] valueForKey:@"content"];
            [self.productsInCategories addObject:productsInCategory];
            
            ASOXScrollTableViewCell *cellElements = [ASOXScrollUtility fillUpCell:@"ProductViewCell" withContents:productsInCategory.products atSection:i delegate:self];
            [self.horizontalScrollElements addObject:cellElements];
        }
    }
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self.productsInCategories count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [[self.productsInCategories objectAtIndex:section] category];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [[self.horizontalScrollElements objectAtIndex:indexPath.section] contentViewCellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ASOXScrollTableViewCell *cell = [ASOXScrollUtility tableView:tableView cellForRowAtIndexPath:indexPath withContents:self.horizontalScrollElements];
    
    return cell;
}

#pragma mark - ASOXScrollTableViewCellDelegate methods

- (UITableViewCell *)horizontalScrollTableView:(UITableView *)tableView cellForRow:(NSUInteger)row atSection:(NSUInteger)section {
    static NSString *cellIdentifier = @"ProductViewCell";
    __weak ProductViewCell *cell = (ProductViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil] lastObject];
    }
    
    __weak NSDictionary *cellContent = [[[self.horizontalScrollElements objectAtIndex:section] contents] objectAtIndex:row];
    
    UIImage *image = [UIImage imageNamed:[cellContent valueForKey:@"imageName"]];
    [cell.thumbnail setImage:image];
    cell.title.text = [cellContent objectForKey:@"title"];
    cell.price.text = [cellContent objectForKey:@"price"];
        
    return cell;
}

- (void)horizontalScrollTableView:(UITableView *)tableView didSelectRow:(NSUInteger)row atSection:(NSUInteger)section {
    NSLog(@"Section %lu Row %lu is selected", (unsigned long)section, (unsigned long)row);
}

@end
