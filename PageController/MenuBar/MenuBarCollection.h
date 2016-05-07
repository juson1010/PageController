//
//  MenuBarCollection.h
//  T02
//
//  Created by cqx on 16/4/30.
//  Copyright © 2016年 cqx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MenuBarCollection : NSObject

@property (nonatomic ,readonly) CGFloat itemWidth;
@property (nonatomic ,readonly) CGFloat itemHeight;

@property (nonatomic,copy) NSArray* itemNames;
@property (nonatomic,strong) UICollectionView* collectionView;
@property (nonatomic,weak) UIScrollView* scrollView;
@property (nonatomic,assign)NSInteger selectedItemIndex;
- (instancetype)initWithMenuBar:(UICollectionView *)view and: (UIScrollView*) contentScrollView;

-(void) setSelectItemAtIndex:(NSInteger)index;
-(void) setDeSelectItemAtIndex:(NSInteger)index;
-(void) setMaxItemNumbers:(int)numbers;
@end
