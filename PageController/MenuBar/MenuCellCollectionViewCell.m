//
//  MenuCellCollectionViewCell.m
//  T02
//
//  Created by cqx on 16/4/29.
//  Copyright © 2016年 cqx. All rights reserved.
//

#import "MenuCellCollectionViewCell.h"
#import "MenuCellView.h"
@implementation MenuCellCollectionViewCell{
    
    MenuCellView* _menuCellView;

    
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _menuCellView = [[MenuCellView alloc] initWithFrame:frame];
        [self.contentView addSubview:_menuCellView];
    }
    return self;

}
-(void)setNameOfItem:(NSString *)nameOfItem{
    
    _menuCellView.label.text = nameOfItem;

}
- (void)layoutSubviews {
    [super layoutSubviews];
    _menuCellView.frame = self.bounds;
}
-(void)setItemColor:(UIColor *)color{
    
    _menuCellView.label.textColor = color;
}

- (void)setHighlightSelection:(BOOL)highlight{
    
    [_menuCellView setHighlightSelection:highlight];
}


@end
