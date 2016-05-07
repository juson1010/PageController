# PageController




1.copy PageController/PageController

2.
@interface ViewController :PageControllerViewController

3.
//.m

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
