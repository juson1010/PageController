//
//  PageControllerViewController.h
//  T02
//
//  Created by cqx on 16/4/29.
//  Copyright © 2016年 cqx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  MenuBarCollection;
@interface PageControllerViewController : UIViewController

@property (nonatomic ,assign) CGFloat width;
@property (nonatomic ,assign) CGFloat height;
@property (nonatomic,assign) NSInteger selectedItemIndex;
@property (nonatomic , assign)int maxItemNumbers;
@property (nonatomic ,strong) MenuBarCollection* menuBar;

-(void) setItemNames:(NSArray*)itemNames itemViews:(NSArray*)itemViews;
-(void) setMaxItemNumbers:(int)numbers;

@end
