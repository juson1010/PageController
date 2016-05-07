//
//  MenuCellCollectionViewCell.h
//  T02
//
//  Created by cqx on 16/4/29.
//  Copyright © 2016年 cqx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCellCollectionViewCell : UICollectionViewCell

- (void)setHighlightSelection:(BOOL)highlight;
-(void) setNameOfItem:(NSString *)nameOfItem;
-(void) setItemColor:(UIColor *) color;

@end
