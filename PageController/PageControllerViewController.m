//
//  PageControllerViewController.m
//  T02
//
//  Created by cqx on 16/4/29.
//  Copyright © 2016年 cqx. All rights reserved.
//

#import "PageControllerViewController.h"
#import "MenuBarCollection.h"


@interface PageControllerViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView* scrollView;

@property (nonatomic ,copy) NSArray* itemNames;
@property (nonatomic ,copy) NSArray* itemViews;

@end

@implementation PageControllerViewController{
    
    
    
    /* */
    UICollectionView* _menuBarCollectionView;
    UIScrollView* _contentScrollView;
    int _preIndex;
    
    
}

-(void)setMenuBarScrollEnable:(BOOL)enable{
    
    _menuBar.collectionView.scrollEnabled = enable;
}
-(void)initWithItemNames:(NSArray *)itemNames itemViews:(NSArray *)itemViews{
    
    _preIndex = 0;
    _itemNames = itemNames;
    _itemViews = itemViews;
    
    
    [self initContentScrollView];
    [self initMenuBar];
    
    if (itemNames.count<4) {
        _maxItemNumbers = (int)itemNames.count;
    }else{
        _maxItemNumbers = 4;
    }
    
    [_menuBar setMaxItemNumbers:_maxItemNumbers];
    
    for (UIViewController* item in [self childViewControllers]) {
        
        [self addObserver:item forKeyPath:@"selectedItemIndex" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    }
    
    
}
-(void)setMenuBarBackGroundColor:(UIColor *)color{
    _menuBar.collectionView.backgroundColor = color;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [_menuBar setDeSelectItemAtIndex:_preIndex];
    int index = 0;
    _preIndex = index;
    
    
    if (index+1 >= _maxItemNumbers) {
        [_menuBar.collectionView setContentOffset:CGPointMake(_menuBar.itemWidth*(index+1-_maxItemNumbers), 0.0f)];
        //            NSLog(@"content off set x : %f",_menuBar.itemWidth*(index+1-_maxItemNumbers));
    }
    
    [_menuBar setSelectItemAtIndex:index];
    
    //        _selectedItemIndex = index;
    NSString* indexStr = [NSString stringWithFormat:@"%d",index];
    [self setValue:indexStr forKey:@"selectedItemIndex"];

}
-(void) initModels{
    
}
-(void)setMaxItemNumbers:(int)numbers{
    
    _maxItemNumbers = numbers;
    [_menuBar setMaxItemNumbers:numbers];
}
-(void)viewDidAppear:(BOOL)animated{
    
    [_menuBar setSelectItemAtIndex:0];
}

-(void) initContentScrollView{
    
    NSLog(@"width : %f height: %f",self.view.frame.size.width,self.view.frame.size.height);
    
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 64.0f, self.view.frame.size.width, self.view.frame.size.height - 64.0f)];
    
    
    _contentScrollView.scrollEnabled = YES;
    
    _contentScrollView.delegate = self;
    _contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width*_itemNames.count, self.view.frame.size.height-64.0f);
    _contentScrollView.pagingEnabled = YES;
    
    [self contentScrollViewAddSubViews];
    
}
-(void)contentScrollViewAddSubViews{
    
    int index = 0;
    CGFloat screenWidth = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    if (_itemViews.count < 1) {
        return;
    }
    UIView* preView = nil;
    for (UIView* curView in _itemViews) {
        if (preView != curView) {
            curView.frame = CGRectMake(screenWidth*index, 0.0f, screenWidth, screenHeight);
            [_contentScrollView addSubview:curView];
        }
        
        index++;
        preView = curView;
        
        
    }
    preView = [[UIView alloc] init];
    preView.backgroundColor = [UIColor whiteColor];
    preView.frame =  CGRectMake(screenWidth*index, 0.0f, screenWidth, screenHeight);
    [_contentScrollView addSubview:preView];
    
    [self.view addSubview:_contentScrollView];

    
}

-(void) initMenuBar{
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    _menuBarCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64.0f) collectionViewLayout:flowLayout];
    _menuBarCollectionView.scrollEnabled = YES;
    _menuBarCollectionView.pagingEnabled = NO;
    _menuBarCollectionView.backgroundColor = [UIColor whiteColor];
    _menuBar = [[MenuBarCollection alloc] initWithMenuBar:_menuBarCollectionView and:_contentScrollView];
    
    [self.view addSubview:_menuBar.collectionView];
   
    [self menuBarAddItemsNameAndViews];
    
}
-(void) menuBarAddItemsNameAndViews{
    _menuBar.itemNames = [[NSArray alloc] initWithArray:_itemNames];
    _menuBar.itemViews = [[NSArray alloc] initWithArray:_itemViews];
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    
    float offset = _contentScrollView.contentOffset.x;
    
    int width = (int)self.view.frame.size.width;
    if ((int)offset%width != 0) {
        
        [_contentScrollView setContentOffset:CGPointMake(offset, 0.0f)];
    }
    float screenWidth = self.view.bounds.size.width;
    int index =  (int) roundf(offset / screenWidth);
    //    NSLog(@"offset %f",offset);
    //    _CQX_index += incre;
    
    
    if (_preIndex != index) {
        
        [_menuBar setDeSelectItemAtIndex:_preIndex];
        _preIndex = index;
     
        
        if (index+1 >= _maxItemNumbers) {
            [_menuBar.collectionView setContentOffset:CGPointMake(_menuBar.itemWidth*(index+1-_maxItemNumbers), 0.0f)];
            //            NSLog(@"content off set x : %f",_menuBar.itemWidth*(index+1-_maxItemNumbers));
        }
       
        [_menuBar setSelectItemAtIndex:index];

//        _selectedItemIndex = index;
        NSString* indexStr = [NSString stringWithFormat:@"%d",index];
        [self setValue:indexStr forKey:@"selectedItemIndex"];
        
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
