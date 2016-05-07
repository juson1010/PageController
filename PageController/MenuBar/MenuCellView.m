//
//  MenuCellView.m
//  T02
//
//  Created by cqx on 16/4/30.
//  Copyright © 2016年 cqx. All rights reserved.
//

#import "MenuCellView.h"

@implementation MenuCellView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.label               = [[UILabel alloc] init];
        self.label.font          = [UIFont boldSystemFontOfSize:18];
        self.label.textColor = [UIColor darkGrayColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
        
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 10.0f;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.label.frame = self.bounds;
}

#pragma mark - Public methods
- (void)setHighlightSelection:(BOOL)highlight {
    if (highlight) {

        self.label.textColor = [UIColor redColor];
        NSLog(@"select!");
    } else {
        NSLog(@"deselect");
        self.label.textColor = [UIColor darkGrayColor];
    }
}
@end
