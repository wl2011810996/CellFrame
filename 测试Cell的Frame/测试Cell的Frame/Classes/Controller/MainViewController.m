//
//  MainViewController.m
//  测试Cell的Frame
//
//  Created by 荣耀iMac on 16/5/23.
//  Copyright © 2016年 GloriousSoftware. All rights reserved.
//

#import "MainViewController.h"
#import "Status.h"
#import "MyCell.h"
#import "StatusFrame.h"

@interface MainViewController ()

@property (nonatomic,strong)NSMutableArray *statusFrames;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self loadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(NSMutableArray *)statusFrames
{
    if (_statusFrames==nil) {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
}

-(void)loadData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"statuses" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        Status *status = [[Status alloc]initWithDict:dict];
        
        StatusFrame *statusFrame = [[StatusFrame alloc]init];
        statusFrame.status = status;
        
        [arrayM addObject:statusFrame];
    }
    self.statusFrames = arrayM;
    
    NSLog(@"%@",self.statusFrames);
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [MyCell cellWithTableView:tableView];
    cell.statusFrame = self.statusFrames[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}

@end
