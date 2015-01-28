//
//  OneFingerLayoutViewController.m
//  test
//
//  Created by XiangqiTu on 14-11-20.
//
//

#import "OneFingerLayoutViewController.h"
#import "UIView+Frame.h"
#import "BaseFlowTextBubbleView.h"
#import "BaseFlowInputToolView.h"
#import "BaseFlowTagsView.h"

typedef enum {
    E_BaseFlowEdite_StatusNone = 0,
    E_BaseFlowEdite_StatusTextBubble = 1,
    E_BaseFlowEdite_StatusTags = 2,
}E_BaseFlowEdite_Status;

@interface OneFingerLayoutViewController () <UIGestureRecognizerDelegate, HPGrowingTextViewDelegate>

@property (nonatomic, strong) UIImageView       *imageView;
@property (nonatomic, strong) UIView            *workspaceView;

@property (nonatomic, strong) BaseFlowInputToolView     *inputToolView;
@property (nonatomic, assign) E_BaseFlowEdite_Status    editeStatus;

@end

@implementation OneFingerLayoutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.editeStatus = E_BaseFlowEdite_StatusNone;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initSubViews];
    [self addKeyboardObserver];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(responseToTapBackground:)];
    [tap setNumberOfTapsRequired:1];
    [tap setNumberOfTouchesRequired:1];
    [tap setCancelsTouchesInView:NO];
    [tap setDelegate:self];
    [self.view addGestureRecognizer:tap];
}

- (void)dealloc
{
    [self removeKeyboardObsever];
}

- (void)addKeyboardObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification 
                                               object:nil];
}

- (void)removeKeyboardObsever
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)initSubViews
{
    CGRect r = [[UIScreen mainScreen] bounds];
    
    self.workspaceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, r.size.width , r.size.width)];
    [self.workspaceView setBackgroundColor:[UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.700]];
    [self.workspaceView setClipsToBounds:YES];
    [self.view addSubview:self.workspaceView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.workspaceView.frame];
    [self.imageView setImage:[UIImage imageNamed:@"nonomori"]];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setBackgroundColor:[UIColor clearColor]];
    [self.workspaceView addSubview:self.imageView];
    
    self.inputToolView = [[BaseFlowInputToolView alloc] initWithFrame:CGRectMake(0, r.size.height-44, r.size.width, 44)];
    [self.view addSubview:self.inputToolView];
    [self.inputToolView.textButton addTarget:self action:@selector(responseToTextButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.inputToolView.tagsBUtton addTarget:self action:@selector(responseToTagsButton:) forControlEvents:UIControlEventTouchUpInside];
    self.inputToolView.textView.delegate = self;
    [self.inputToolView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [self.inputToolView setBackgroundColor:[UIColor colorWithRed:0.333 green:0.275 blue:0.765 alpha:0.700]];
}

#pragma mark - UIControl Response
- (void)responseToTextButton:(UIButton *)button
{
    self.editeStatus = E_BaseFlowEdite_StatusTextBubble;
    [self becomeKeyboardStateWithActionButton:button];
    
    BaseFlowTextBubbleView *textView = [[BaseFlowTextBubbleView alloc] init];
    [textView setBackgroundColor:[UIColor colorWithWhite:0.667 alpha:0.400]];
    textView.center = self.workspaceView.center;
    [self.workspaceView addSubview:textView];
}

- (void)responseToTagsButton:(UIButton *)button
{
    self.editeStatus = E_BaseFlowEdite_StatusTags;
    [self becomeKeyboardStateWithActionButton:button];
    
    BaseFlowTagsView *tagsView = [[BaseFlowTagsView alloc] initWithImage:[UIImage imageNamed:@"chat_message_failture"]];
    [tagsView setCenter:CGPointMake(self.workspaceView.width/2, self.workspaceView.height/2)];
    CGFloat ratio = 0.8;
    [tagsView setScale:ratio];
    [self.workspaceView addSubview:tagsView];
    [BaseFlowTagsView setActiveBaseFlowTagsView:tagsView];
    
    tagsView.alpha = 0.2;
    [UIView animateWithDuration:.35f
                     animations:^{
                         tagsView.alpha = 1;
                     }
     ];
}

- (void)responseToKeyboardButton:(UIButton *)button
{
    [self.view endEditing:YES];
    if (self.editeStatus == E_BaseFlowEdite_StatusTags) {
        [button setTitle:@"Tags" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(responseToTagsButton:) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [button setTitle:@"T" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(responseToTextButton:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)responseToTapBackground:(UIGestureRecognizer *)tap
{
    [BaseFlowTextBubbleView setActiveTextView:nil];
    [self.view endEditing:YES];
}

- (void)becomeKeyboardStateWithActionButton:(UIButton *)button
{
    [button setTitle:@"键盘" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(responseToKeyboardButton:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
{
    if ([touch.view isKindOfClass:[UIControl class]]) {
        return NO;
    }
    
    return YES;
}

//Code from Brett Schumann
-(void) keyboardWillShow:(NSNotification *)note{
    // get keyboard size and loctaion
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    // get a rect for the textView frame
    CGRect containerFrame = self.inputToolView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - (keyboardBounds.size.height + containerFrame.size.height);
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
    // set views with new info
    self.inputToolView.frame = containerFrame;
    
    
    // commit animations
    [UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // get a rect for the textView frame
    CGRect containerFrame = self.inputToolView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - containerFrame.size.height;
    
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
    // set views with new info
    self.inputToolView.frame = containerFrame;
    
    // commit animations
    [UIView commitAnimations];
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    float diff = (growingTextView.frame.size.height - height);
    
    CGRect r = self.inputToolView.frame;
    r.size.height -= diff;
    r.origin.y += diff;
    self.inputToolView.frame = r;
}

- (BOOL)growingTextViewShouldReturn:(HPGrowingTextView *)growingTextView
{
    return NO;
}

@end
