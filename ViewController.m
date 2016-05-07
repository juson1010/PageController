//
//  ViewController.m
//  PageController
//
//  Created by cqx on 16/5/7.
//  Copyright © 2016年 cqx. All rights reserved.
//

#import "ViewController.h"

#import "PageATableViewController.h"
#import "PageBViewController.h"
@interface ViewController ()

@end

@implementation ViewController{
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];


    
    NSMutableArray* itemNames = [[NSMutableArray alloc] initWithCapacity:10];
    NSMutableArray* itemViews = [[NSMutableArray alloc] initWithCapacity:10];
    
   //view1
    UIView* view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];

   
    //view2
    PageATableViewController* pageA = [self.storyboard instantiateViewControllerWithIdentifier:@"PageA"];
    [self addChildViewController:pageA];
    
    //view3
    PageBViewController* pageB = [self.storyboard instantiateViewControllerWithIdentifier:@"PageB"];
    [self addChildViewController:pageB];
    
    
    
    //view4
    UIView* view4 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor blackColor];
    
    
    [itemViews addObject:view1];
    [itemViews addObject:pageA.tableView];
    [itemViews addObject:pageB.view];
    [itemViews addObject:view4];
    
    [itemNames addObject:@"item01"];
    [itemNames addObject:@"item02"];
    [itemNames addObject:@"item03"];
    [itemNames addObject:@"item04"];
    
    [self setItemNames:itemNames itemViews:itemViews];
        [self setMaxItemNumbers:3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
