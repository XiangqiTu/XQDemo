//
//  ChatViewController.m
//  test
//
//  Created by XiangqiTu on 14-9-10.
//
//

#import "ChatViewController.h"
#import "UIView+AnimationOptionsForCurve.h"
#import "ChatTextCell.h"
#import "FunLoadingView.h"

#import "ChatMessageUtil.h"

#define INPUT_HEIGHT 43.0f
#define k_MESSAGE_LIMIT 20
#define kLastestMessageRequestFlag  @""
#define kAlertResendMessageTag      19880001

@interface ChatViewController () <UITableViewDataSource, UITableViewDelegate, ChatTextViewDelegate, HPGrowingTextViewDelegate,NSFetchedResultsControllerDelegate, ChatTextCellDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) UITableView                *tableView;
@property (nonatomic, strong) ChatInputView              *inputToolBarView;
@property (nonatomic, strong) FunLoadingView             *funLoadingView;

@property (nonatomic, strong) NSMutableArray             *dataSourceArray;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong) UIRefreshControl           *refreshControl;
@property (nonatomic        ) BOOL                       isShowRefreshControl;
@property (nonatomic, copy  ) dispatch_block_t           beginningReFreshBlock;
@property (nonatomic, strong) NSString                   *lastFetchedResultDate;

@property (nonatomic, strong) NSString                   *friendId;

@property (nonatomic, strong) ChatContentMessageEntity   *tempChatMessageEntity;

@end

@implementation ChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.dataSourceArray = [NSMutableArray arrayWithCapacity:5];
        self.friendId = @"2";
        self.isShowRefreshControl = YES;
        NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
        self.lastFetchedResultDate = [NSString stringWithFormat:@"%lld",(long long)timestamp];
        
        [self initFetchedResultsContorller];
    }
    return self;
}

- (void)setup
{
    if([self.view isKindOfClass:[UIScrollView class]]) {
        // fix for ipad modal form presentations
        ((UIScrollView *)self.view).scrollEnabled = NO;
    }
    
    CGSize size = self.view.frame.size;
	
    CGRect tableFrame = CGRectMake(0.0f, 0.0f, size.width, size.height - INPUT_HEIGHT);
	self.tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
	self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	[self.view addSubview:self.tableView];
	
    [self setBackgroundColor:[UIColor chatVCBackgroundColor]];
    
    CGRect inputFrame = CGRectMake(0.0f, size.height - INPUT_HEIGHT, size.width, INPUT_HEIGHT);
    self.inputToolBarView = [[ChatInputView alloc] initWithFrame:inputFrame delegate:self];
    
    self.inputToolBarView.textView.dismissivePanGestureRecognizer = self.tableView.panGestureRecognizer;
    self.inputToolBarView.textView.keyboardDelegate = self;
    
    [self.view addSubview:self.inputToolBarView];
    
    [self setNavigationItem];
}

- (void)setNavigationItem
{   
    self.funLoadingView = [[NSBundle mainBundle] loadNibNamed:@"FunLoadingView" owner:self options:nil][0];
    [self.funLoadingView startAnimation];
    [self setRightBarItemWithCustomView:self.funLoadingView];
}

- (void)setViewControllerPropertyForIOSVersion
{
    if (_Owner_IOS_VERSION >= 7.0) {
        if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
            self.edgesForExtendedLayout = UIRectEdgeAll;
            self.extendedLayoutIncludesOpaqueBars = YES;
            self.automaticallyAdjustsScrollViewInsets = YES;
        }
    }
}

- (void)setBackgroundColor:(UIColor *)color
{
    self.view.backgroundColor = color;
    self.tableView.backgroundColor = color;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
    [self setTapBackGround];
    [self setViewControllerPropertyForIOSVersion];
    
    //Refresh
    if (self.isShowRefreshControl) {
        self.refreshControl = [[UIRefreshControl alloc] init];
        [self.refreshControl setTintColor:[UIColor redColor]];
        [self.refreshControl setBackgroundColor:[UIColor chatVCBackgroundColor]];
        [self.refreshControl addTarget:self action:@selector(refreshViewControlEventValueChanged:) forControlEvents:UIControlEventValueChanged];
        CGRect r = self.refreshControl.frame;
        r.origin.y = -_tableView.frame.size.height - self.refreshControl.frame.size.height;
        [self.refreshControl setFrame:r];
        [_tableView addSubview:self.refreshControl];
    }
    
    __weak typeof(self) wself = self;
    
    [self setRefreshControlBeginRefreshBlock:^{
        [wself getHistoryDataInCoreData];
        [wself performSelector:@selector(delayLayoutHistoryData) withObject:nil afterDelay:1];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(handleWillShowKeyboard:)
												 name:UIKeyboardWillShowNotification
                                               object:nil];
    
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(handleWillHideKeyboard:)
												 name:UIKeyboardWillHideNotification
                                               object:nil];
    [self scrollToBottomAnimated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.inputToolBarView resignFirstResponder];
    [self setEditing:NO animated:YES];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)scrollToBottomAnimated:(BOOL)animated
{
    NSInteger rows = [self.tableView numberOfRowsInSection:0];
    
    if(rows > 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:rows - 1 inSection:0]
                              atScrollPosition:UITableViewScrollPositionBottom
                                      animated:animated];
    }
}

#pragma mark - UIControl
- (void)ChatTextCell:(ChatTextCell *)cell didTouchResendButton:(UIButton *)resendButton
{
    self.tempChatMessageEntity = cell.chatMessageEntity;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"是否重发该消息"
                                                   delegate:self
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:@"确定", nil];
    alert.tag = kAlertResendMessageTag;
    [alert show];
}

#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == kAlertResendMessageTag) {
        if (alertView.cancelButtonIndex == buttonIndex) {
            return;
        } else {
            [self.tableView beginUpdates];
            NSInteger   index = [self.dataSourceArray indexOfObject:self.tempChatMessageEntity];
            [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
            [self.dataSourceArray removeObject:self.tempChatMessageEntity];
            [self.tableView endUpdates];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[ChatMessageCoreDataStorage sharedInstance] deleteChatContentMessageWithMsgId:self.tempChatMessageEntity.msgId clientId:@"2"];
                [self sendMessage:self.tempChatMessageEntity.body];
            });   
        }
    }
}

#pragma mark - UIRefresh Control
- (void)refreshViewControlEventValueChanged:(id)sender
{
    if (self.refreshControl.refreshing)
    {
        if (self.beginningReFreshBlock) {
            self.beginningReFreshBlock();
        }
    }
}

- (void)beginRefresh
{
    [self.refreshControl beginRefreshing];
    [_tableView setContentOffset:CGPointMake(0, -60)];
}

- (void)endRefresh
{
    [self.refreshControl endRefreshing];
    [_tableView reloadData];
    
}

- (void)setRefreshControlBeginRefreshBlock:(void (^)(void))block
{
    self.beginningReFreshBlock = block;
}

- (void)delayLayoutHistoryData
{
    [self endRefresh];
    [_tableView reloadData];
}

- (void)getHistoryDataInCoreData
{
    NSManagedObjectContext *context = [[ChatMessageCoreDataStorage sharedInstance] mainThreadManagedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:kChatContentMessageEntity inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"creatTimestamp" ascending:NO];//按日期排序（ascending）为升序
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    NSPredicate *pridicate = [NSPredicate predicateWithFormat:@"friendId == $friendId AND clientId == $clientId AND creatTimestamp < $timestamp"];
    NSDictionary *variables = @{@"friendId": self.friendId, @"clientId":@"2",@"timestamp":self.lastFetchedResultDate};
    pridicate = [pridicate predicateWithSubstitutionVariables:variables];
    [request setPredicate:pridicate];
    
    [request setFetchLimit:k_MESSAGE_LIMIT];
    [request setSortDescriptors:sortDescriptors];
    [request setEntity:entityDescription];
    
    NSArray *result = [context executeFetchRequest:request error:nil];
    
    for (ChatContentMessageEntity *obj in result) {
        [self.dataSourceArray insertObject:obj atIndex:0];
        
        //保留最后一个数据时间
        if ([[result lastObject] isEqual:obj]) {
            self.lastFetchedResultDate = obj.creatTimestamp;
        }
        
    }
}

#pragma mark - NSFetchedResultsContorller
- (void)initFetchedResultsContorller
{
    NSManagedObjectContext *moc = [[ChatMessageCoreDataStorage sharedInstance] mainThreadManagedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:kChatContentMessageEntity
                                              inManagedObjectContext:moc];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSPredicate *pridicate = [NSPredicate predicateWithFormat:@"clientId == %@ AND friendId == %@",@"2",self.friendId];//查询谓词
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"creatTimestamp" ascending:NO];//按日期排序（ascending）为升序
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    
    [request setFetchLimit:k_MESSAGE_LIMIT];
    [request setSortDescriptors:sortDescriptors];
    [request setEntity:entity];
    [request setPredicate:pridicate];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                    managedObjectContext:moc
                                                                      sectionNameKeyPath:nil
                                                                               cacheName:nil];
    
    //查询控制器
    _fetchedResultsController.delegate = self;
    
    NSError *fetchingError;
    if ([self.fetchedResultsController performFetch:&fetchingError]){
        for (ChatContentMessageEntity *obj in _fetchedResultsController.fetchedObjects) {
            [self.dataSourceArray insertObject:obj atIndex:0];
            
            //保留最后一个数据时间
            if ([[_fetchedResultsController.fetchedObjects lastObject] isEqual:obj]) {
                self.lastFetchedResultDate = obj.creatTimestamp;
            }
        }
    }
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    switch (type) {
        case NSFetchedResultsChangeInsert:
        {
            ChatContentMessageEntity *entity = anObject;
            [self.dataSourceArray addObject:entity];
            [_tableView reloadData];
            [self scrollToBottomAnimated:YES];
            break;
        }
            
        default:
        {
            [self.tableView reloadData];
            break;
        }
    }
}

#pragma mark - Table view data source & delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"ChatTextCell";
    ChatTextCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ChatTextCell" owner:self options:nil][0];
        cell.delegate = self;
    }
    
    ChatContentMessageEntity *entity = [self.dataSourceArray objectAtIndex:indexPath.row];
    [cell setCellData:entity];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatContentMessageEntity *entity = [self.dataSourceArray objectAtIndex:indexPath.row];
    return [ChatTextCell chatTextCellHeightWithData:entity];
}

#pragma mark - Text view delegate
- (void)growingTextViewDidBeginEditing:(HPGrowingTextView *)growingTextView;
{
    [growingTextView becomeFirstResponder];
    
    [self scrollToBottomAnimated:YES];
}

- (void)growingTextViewDidEndEditing:(HPGrowingTextView *)growingTextView;
{
    [growingTextView resignFirstResponder];
}

- (BOOL)growingTextView:(HPGrowingTextView *)growingTextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
{
    if ([text isEqualToString:@"\n"]) {
        [self sendMessage:growingTextView.text];
        growingTextView.text = nil;
        return NO;
	}
    return YES;
}

- (void)growingTextViewDidChange:(HPGrowingTextView *)growingTextView
{
//    NSString *trimWhitespace = [growingTextView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    self.inputToolBarView.sendButton.enabled = (trimWhitespace.length > 0);
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    float diff = (growingTextView.frame.size.height - height);
    
	CGRect r = self.inputToolBarView.frame;
    r.size.height -= diff;
    r.origin.y += diff;
	self.inputToolBarView.frame = r;
    self.inputToolBarView.diff = diff;
}

#pragma mark - Keyboard notifications
- (void)handleWillShowKeyboard:(NSNotification *)notification
{
    [self keyboardWillShowHide:notification];
}

- (void)handleWillHideKeyboard:(NSNotification *)notification
{
    [self keyboardWillShowHide:notification];
}

- (void)keyboardWillShowHide:(NSNotification *)notification
{
    CGRect keyboardRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
	UIViewAnimationCurve curve = [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
	double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration
                          delay:0.0f
                        options:[UIView animationOptionsForCurve:curve]
                     animations:^{
                         CGFloat keyboardY = [self.view convertRect:keyboardRect fromView:nil].origin.y;
                         
                         CGRect inputViewFrame = self.inputToolBarView.frame;
                         CGFloat inputViewFrameY = keyboardY - inputViewFrame.size.height;
                         
                         // for ipad modal form presentations
                         CGFloat messageViewFrameBottom = self.view.frame.size.height - INPUT_HEIGHT;
                         if(inputViewFrameY > messageViewFrameBottom)
                             inputViewFrameY = messageViewFrameBottom;
                         
                         self.inputToolBarView.frame = CGRectMake(inputViewFrame.origin.x,
                                                                  inputViewFrameY,
                                                                  inputViewFrame.size.width,
                                                                  inputViewFrame.size.height);
                         
                         UIEdgeInsets insets = UIEdgeInsetsMake(0.0f,
                                                                0.0f,
                                                                self.view.frame.size.height - self.inputToolBarView.frame.origin.y - INPUT_HEIGHT,
                                                                0.0f);
                         if (_Owner_IOS_VERSION >= 7.0) {
                             insets = UIEdgeInsetsMake(64.0f,
                                                       0.0f,
                                                       self.view.frame.size.height - self.inputToolBarView.frame.origin.y - INPUT_HEIGHT,
                                                       0.0f);
                         }
                         self.tableView.contentInset = insets;
                         self.tableView.scrollIndicatorInsets = insets;
                     }
                     completion:^(BOOL finished) {
                             NSLog(@"%f",[[UIScreen mainScreen] scale]);
                     }];
}

#pragma mark - Dismissive text view delegate
- (void)keyboardDidScrollToPoint:(CGPoint)pt
{
    CGRect inputViewFrame = self.inputToolBarView.frame;
    CGPoint keyboardOrigin = [self.view convertPoint:pt fromView:nil];
    inputViewFrame.origin.y = keyboardOrigin.y - inputViewFrame.size.height;
    self.inputToolBarView.frame = inputViewFrame;
}

- (void)keyboardWillBeDismissed
{
    CGRect inputViewFrame = self.inputToolBarView.frame;
    inputViewFrame.origin.y = self.view.bounds.size.height - inputViewFrame.size.height;
    self.inputToolBarView.frame = inputViewFrame;
}

- (void)keyboardWillSnapBackToPoint:(CGPoint)pt
{
    CGRect inputViewFrame = self.inputToolBarView.frame;
    CGPoint keyboardOrigin = [self.view convertPoint:pt fromView:nil];
    if (keyboardOrigin.x != keyboardOrigin.x || keyboardOrigin.y != keyboardOrigin.y) {
        return;
    }
    inputViewFrame.origin.y = keyboardOrigin.y - inputViewFrame.size.height;
    self.inputToolBarView.frame = inputViewFrame;
}


#pragma mark - Network
- (void)getLastChatMessage
{
    [self.funLoadingView startAnimation];
    [[NetworkCenter sharedInstance] getLatestChatMessageWithFriendId:self.friendId
                                                      fetchTimestamp:kLastestMessageRequestFlag
                                                             success:^(NSDictionary *result) {
                                                                 [self.funLoadingView stopAnimation];
                                                             } failture:^(NSString *code) {
                                                                 [self.funLoadingView stopAnimation];
                                                             }];
}

- (void)sendMessage:(NSString *)body
{
    [[ChatMessageUtil sharedInstance] sendMessageWithBody:body to:self.friendId];
}
@end
