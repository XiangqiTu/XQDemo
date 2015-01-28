//
//  PictureFlowViewController.m
//  test
//
//  Created by XiangqiTu on 14-10-23.
//
//

#import "PictureFlowViewController.h"
#import "TestTableViewCell.h"
#import "PictureFlowPresentTemp.h"

@interface PictureFlowViewController ()

@property (nonatomic, strong) NSMutableArray        *dataSourceArray;

@end

@implementation PictureFlowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.dataSourceArray = [NSMutableArray array];
        
        PictureFlowPresentTemp *temp1 = [PictureFlowPresentTemp presentTempWithTitle:@"a" fee:@1];
        PictureFlowPresentTemp *temp2 = [PictureFlowPresentTemp presentTempWithTitle:@"b" fee:@2];
        PictureFlowPresentTemp *temp3 = [PictureFlowPresentTemp presentTempWithTitle:@"c" fee:@3];
        PictureFlowPresentTemp *temp4 = [PictureFlowPresentTemp presentTempWithTitle:@"d" fee:@4];
        PictureFlowPresentTemp *temp5 = [PictureFlowPresentTemp presentTempWithTitle:@"e" fee:@5];
        PictureFlowPresentTemp *temp6 = [PictureFlowPresentTemp presentTempWithTitle:@"f" fee:@6];
        
        PictureFlowPresentTemp *temp8 = [PictureFlowPresentTemp presentTempWithTitle:@"f" fee:@6];
        
        [self.dataSourceArray addObjectsFromArray:@[temp1,temp2,temp3,temp4,temp5,temp6,temp8]];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TestTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"TestTableViewCell";
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    PictureFlowPresentTemp *temp = [self.dataSourceArray objectAtIndex:indexPath.row];
    [cell.contentImageView setImage:[UIImage imageNamed:@"chat_protrait_default1"]];
    [cell.bottomLabel setText:[NSString stringWithFormat:@"here is label show   %@ \n---------华丽的分割线----------",temp.title]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetWidth(tableView.bounds)+100;
}

@end
