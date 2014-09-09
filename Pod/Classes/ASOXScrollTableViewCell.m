 //
//  ASOXScrollTableViewCell.m
//  ASOXScrollTableViewCell
//
//  Created by Agus Soedibjo on 29/08/2014.
//  Copyright 2011 Agus Soedibjo. All rights reserved.
//

#import "ASOXScrollTableViewCell.h"
#import "ASOXScrollTableViewCellDelegate.h"

@interface ASOXScrollTableViewCell () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ASOXScrollTableViewCell {
    NSUInteger _section;
}

#pragma mark - Inherited methods

- (NSString *)reuseIdentifier
{
    return [[self class] classReuseIdentifier];
}

#pragma mark - Public methods

+ (NSString *)classReuseIdentifier {
    return NSStringFromClass([self class]);
}

- (id)initWithContentViewCellName:(NSString *)classString section:(NSUInteger)horizontalCellSection delegate:(id)object {
    if (self == [super init]) {
        UITableViewCell *contentViewCellObject= [[[NSBundle mainBundle] loadNibNamed:classString owner:self options:nil] lastObject];
        self.contentViewCellWidth = contentViewCellObject.frame.size.height;
        self.contentViewCellHeight = contentViewCellObject.frame.size.width;
        
        UITableView *horizontalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.contentViewCellHeight, self.frame.size.width)];
        
        horizontalTableView.showsVerticalScrollIndicator = NO;
        horizontalTableView.showsHorizontalScrollIndicator = NO;
        horizontalTableView.transform = CGAffineTransformMakeRotation(-M_PI * 0.5);
        
        [horizontalTableView setFrame:CGRectMake(0, 0, self.frame.size.width, self.contentViewCellHeight)];
        
        horizontalTableView.rowHeight = self.contentViewCellWidth;
        
        horizontalTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        horizontalTableView.separatorColor = [UIColor clearColor];
        
        horizontalTableView.dataSource = self;
        horizontalTableView.delegate = self;
        
        [self addSubview:horizontalTableView];
        [self addAutoLayoutToView:horizontalTableView];
        
        _section = horizontalCellSection;
        
        self.delegate = object;
    }
    
    return self;
}

#pragma mark - Local methods

- (void)addAutoLayoutToView:(UITableView *)tableView {
    [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:0 toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.contentViewCellHeight]];
}

#pragma mark - Table View Data Source methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate horizontalScrollTableView:tableView cellForRow:indexPath.row atSection:_section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contents count];
}

#pragma mark - Table View Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(horizontalScrollTableView:didSelectRow:atSection:)]) {
        [self.delegate horizontalScrollTableView:tableView didSelectRow:indexPath.row atSection:_section];
    }
}

@end
