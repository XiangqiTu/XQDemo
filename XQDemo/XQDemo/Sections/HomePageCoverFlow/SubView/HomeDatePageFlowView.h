//
//  HomeDatePageFlow.h
//  XQDemo
//
//  Created by XiangqiTu on 15-4-13.
//
//

#import <UIKit/UIKit.h>
@protocol HomeDatePageFlowViewDataSource;
@protocol HomeDatePageFlowViewDelegate;

@interface HomeDatePageFlowView : UIView
{
    NSInteger           _pageCount;  //总页数
    NSMutableArray      *_cells;
    NSRange              _visibleRange;
    NSMutableArray      *_reusableCells;//如果以后需要支持reuseIdentifier，这边就得使用字典类型了
}

@property(nonatomic,weak)   id <HomeDatePageFlowViewDataSource> dataSource;
@property(nonatomic,weak)   id <HomeDatePageFlowViewDelegate> delegate;
@property (nonatomic, assign) CGFloat minimumPageAlpha;
@property (nonatomic, assign) CGFloat minimumPageScale;

@property (nonatomic, assign, readonly) NSInteger currentPageIndex;

@property (nonatomic,strong) UIScrollView        *scrollView;
@property (nonatomic,assign) CGSize              pageSize; //一页的尺寸

- (UIView *)dequeueReusableCell;

- (void)scrollToPage:(NSUInteger)pageNumber;

@end


@protocol HomeDatePageFlowViewDelegate <NSObject>

- (CGSize)sizeForPageInFlowView:(HomeDatePageFlowView *)flowView;

@optional
- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(HomeDatePageFlowView *)flowView;
- (void)shouldShowSubViewAtIndex:(NSInteger)pageNumber inFlowView:(HomeDatePageFlowView*)flowView;
- (void)selectIndexPage:(int)index;

- (void)shouldLoadingMoreDataInPagedFlowView:(HomeDatePageFlowView *)flowView;

@end


@protocol HomeDatePageFlowViewDataSource <NSObject>

//返回显示View的个数
- (NSInteger)numberOfPagesInFlowView:(HomeDatePageFlowView *)flowView;

//返回给某列使用的View
- (UIView *)flowView:(HomeDatePageFlowView *)flowView cellForPageAtIndex:(NSInteger)index;

@end