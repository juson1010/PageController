//
//  MenuCellView.h
//  T02
//
//  Created by cqx on 16/4/30.
//  Copyright © 2016年 cqx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCellView : UIView

@property (nonatomic, strong) UILabel *label;

- (void)setHighlightSelection:(BOOL)highlight;

@end
