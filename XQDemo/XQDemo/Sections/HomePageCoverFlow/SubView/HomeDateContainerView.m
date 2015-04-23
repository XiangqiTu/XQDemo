//
//  HomeDateContainerView.m
//  XQDemo
//
//  Created by XiangqiTu on 15-4-13.
//
//

#import "HomeDateContainerView.h"
#import "HomeDatePageFlowView.h"
#import "HomeDateCell.h"

@interface HomeDateContainerView ()<HomeDatePageFlowViewDelegate,HomeDatePageFlowViewDataSource>

@property (nonatomic, strong) NSMutableArray    *dateArray;
@property (nonatomic, strong) HomeDatePageFlowView  *datePageFlowView;

@end

@implementation HomeDateContainerView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.dateArray = [NSMutableArray arrayWithCapacity:280];
        [self initSubViews];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.dateArray = [NSMutableArray arrayWithCapacity:280];
    
    [self initSubViews];
}

- (void)initSubViews
{
    if (!self.datePageFlowView) {
        self.datePageFlowView = [[HomeDatePageFlowView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        
        self.datePageFlowView.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.690];
        self.datePageFlowView.delegate = self;
        self.datePageFlowView.dataSource = self;
        self.datePageFlowView.minimumPageAlpha = 0.8;
        self.datePageFlowView.minimumPageScale = 0.5;
        [self addSubview:self.datePageFlowView];
    }
}

- (void)caculateDateWithTimestamp:(NSString *)timestamp
{
    //计算得到280个date
    NSMutableArray  *mut = [NSMutableArray arrayWithCapacity:280];
    for (int i = 0; i<280;i++) {
        [mut addObject:@YES];
    }
    
    [self.dateArray setArray:mut];
}

#pragma mark - PageFlowView DataSouce & Delegate
//返回显示View的个数
- (NSInteger)numberOfPagesInFlowView:(HomeDatePageFlowView *)flowView {
    return [self.dateArray count];
}

//返回给某列使用的View
- (UIView *)flowView:(HomeDatePageFlowView *)flowView cellForPageAtIndex:(NSInteger)index {
    HomeDateCell *cell = (HomeDateCell *)[flowView dequeueReusableCell];
    if (cell == nil || [cell isEqual:[NSNull null]]) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"HomeDateCell" owner:self options:nil][0];
    }
    
    if ([self.dateArray count] <= index) {
        return cell;
    }
    
    return cell;
}

- (CGSize)sizeForPageInFlowView:(HomeDatePageFlowView *)flowView {
    return CGSizeMake(110, 110);
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(HomeDatePageFlowView *)flowView {
    
}

-(void)shouldShowSubViewAtIndex:(NSInteger)pageNumber inFlowView:(HomeDatePageFlowView *)flowView {
    
}

- (void)selectIndexPage:(int)index {
    
}
@end
