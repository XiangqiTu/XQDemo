//
//  MenuTableViewController.m
//  XQDemo
//
//  Created by XiangqiTu on 15-1-25.
//
//

#import "MenuTableViewController.h"
#import "ChatViewController.h"
#import "AutoLayoutViewController.h"
#import "HomePageViewController.h"
#import "OneFingerLayoutViewController.h"
#import "PictureFlowViewController.h"
#import "ShapreLayerControllerViewController.h"

@interface MenuTableViewController ()

@property (nonatomic, strong) NSMutableArray    *dataSourceArray;

@end

@implementation MenuTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        self.dataSourceArray = [NSMutableArray array];
        [self.dataSourceArray addObjectsFromArray:@[@"Chat",@"AutoLayout",@"HomePage",@"OneFingerTransform",@"PicFlow",@"SharpeLayer"]];
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Menu";
    self.tableView.tableFooterView = [UIView new];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.dataSourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
    }
    
    [cell.textLabel setText:self.dataSourceArray[indexPath.row]];
    
    return cell;
}


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = nil;
    switch (indexPath.row) {
        case 0:
        {
            vc = [[ChatViewController alloc] initWithNibName:nil bundle:nil];
            break;
        }
        case 1:
        {
            vc = [[AutoLayoutViewController alloc] initWithNibName:@"AutoLayoutViewController" bundle:[NSBundle mainBundle]];
            break;
        }
        case 2:
        {
            vc = [[HomePageViewController alloc] initWithNibName:nil bundle:nil];
            break;
        }
        case 3:
        {
            vc = [[OneFingerLayoutViewController alloc] initWithNibName:nil bundle:nil];
            break;
        }
        case 4:
        {
            vc = [[PictureFlowViewController alloc] initWithNibName:nil bundle:nil];
            break;
        }
        case 5:
        {
            vc = [[ShapreLayerControllerViewController alloc] initWithNibName:nil bundle:nil];
            break;
        }
        default:
            vc = [[UIViewController alloc] init];
            break;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
