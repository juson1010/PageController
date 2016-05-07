//
//  MenuBarCollection.m
//  T02
//
//  Created by cqx on 16/4/30.
//  Copyright © 2016年 cqx. All rights reserved.
//

#import "MenuBarCollection.h"
#import "MenuCellCollectionViewCell.h"
#import "MenuCellView.h"
static NSString * const reuseIdentifier = @"MenuBarCell";
@interface MenuBarCollection() <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@end
@implementation MenuBarCollection{
    

    int _maxItemNumbers;

        
}

- (instancetype)initWithMenuBar:(UICollectionView *)view and: (UIScrollView*) contentScrollView{
    
   
    self = [super init];
    if (self) {

        [self initCollectionView:view];
        self.scrollView = contentScrollView;
        

    }
    return self;

    
}


- (void)initCollectionView:(UICollectionView *)view {
    _collectionView            = view;
    _collectionView.delegate   = self;
    _collectionView.dataSource = self;
  
    [_collectionView registerClass:[MenuCellCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

-(void)setSelectItemAtIndex:(NSInteger )index{
    
    _selectedItemIndex = index;
    
     MenuCellCollectionViewCell *cell = (MenuCellCollectionViewCell *)[_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    
    
    CGFloat screenWidth = _scrollView.frame.size.width;
    CGFloat screenHeight = _scrollView.frame.size.height;
    if (_scrollView != nil) {
        UIView* tmpView = _itemViews[index];
        tmpView.frame = CGRectMake(screenWidth*index, 0.0f, screenWidth, screenHeight);
    }


    [cell setHighlightSelection:YES];

}

-(void)setDeSelectItemAtIndex:(NSInteger )index{

    MenuCellCollectionViewCell *cell = (MenuCellCollectionViewCell *) [_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    
    [cell setHighlightSelection:NO];
   
}

-(void)setMaxItemNumbers:(int)numbers{
    _maxItemNumbers = numbers;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemNames.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setNameOfItem:_itemNames[indexPath.row]];

    if (indexPath.row != _selectedItemIndex) {
        [cell setHighlightSelection:NO];
    }else{
        [cell setHighlightSelection:YES];
    }
   
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = 0.0f;
    if (_itemNames.count < _maxItemNumbers) {
        
        width = (_collectionView.frame.size.width - 8.0f*(_itemNames.count-1)) / _itemNames.count ;
    }else{
        width = (_collectionView.frame.size.width - 8.0f*(_maxItemNumbers-1)) / _maxItemNumbers ;
    }
   
    _itemWidth = width;
    _itemHeight = 48.0f;
    return CGSizeMake(width, 48.0f);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    self.selectedItemIndex = indexPath.row;//must before cellForItem..
    MenuCellCollectionViewCell *cell = (MenuCellCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    CGFloat screenWidth = _scrollView.frame.size.width;
    CGFloat screenHeight = _scrollView.frame.size.height;
    [cell setHighlightSelection:YES];
    if (_scrollView != nil) {
        UIView* tmpView = _itemViews[indexPath.row];
        tmpView.frame = CGRectMake(screenWidth*indexPath.row, 0.0f, screenWidth, screenHeight);
        
        [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width*indexPath.row, 0.0f)];
    }
    
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuCellCollectionViewCell *cell = (MenuCellCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
//    [[[_models allValues] objectAtIndex:indexPath.row] removeFromSuperview];
    
    [cell setHighlightSelection:NO];

}




@end
