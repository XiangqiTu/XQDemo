//
//  HomeDatePageFlow.m
//  XQDemo
//
//  Created by XiangqiTu on 15-4-13.
//
//

#import "HomeDatePageFlowView.h"
#import "HomeDateCell.h"

@interface HomeDatePageFlowView () <UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, assign, readwrite) NSInteger currentPageIndex;

@end

@implementation HomeDatePageFlowView

#pragma mark -
#pragma mark Private Methods

- (void)initialize{
    self.clipsToBounds = YES;
    _pageSize = CGSizeMake(55, 55);
    _pageCount = 0;
    _currentPageIndex = 0;
    _minimumPageAlpha = 1.0;
    _minimumPageScale = 1.0;
    _visibleRange = NSMakeRange(0, 0);
    _reusableCells = [[NSMutableArray alloc] initWithCapacity:0];
    _cells = [[NSMutableArray alloc] initWithCapacity:0];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.frame = self.frame;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.clipsToBounds = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollsToTop = NO;
    /*由于UIScrollView在滚动之后会调用自己的layoutSubviews以及父View的layoutSubviews
     这里为了避免scrollview滚动带来自己layoutSubviews的调用,所以给scrollView加了一层父View
     */
    UIView *superViewOfScrollView = [[UIView alloc] initWithFrame:self.bounds];
    [superViewOfScrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [superViewOfScrollView setBackgroundColor:[UIColor purpleColor]];
    [superViewOfScrollView addSubview:_scrollView];
    [self addSubview:superViewOfScrollView];
}

- (void)dealloc {
    _delegate = nil;
    _dataSource = nil;
}

#pragma mark -
#pragma mark Override Methods

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initialize];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //如果需要重新加载数据，则需要清空相关数据全部重新加载
    //重置pageCount
    if (_dataSource && [_dataSource respondsToSelector:@selector(numberOfPagesInFlowView:)]) {
        _pageCount = [_dataSource numberOfPagesInFlowView:self];
        if (!_pageCount) {
            return;
        }
    }
    //重置pageWidth
    if (self.delegate && [self.delegate respondsToSelector:@selector(sizeForPageInFlowView:)]) {
        _pageSize = [_delegate sizeForPageInFlowView:self];
    }
    
    [_reusableCells removeAllObjects];
    _visibleRange = NSMakeRange(0, 0);
    
    //填充cells数组
    for (UIView *v in _cells) {
        if ([v isEqual:[NSNull null]]) {
            continue;
        }
        if ([v superview]) {
            [v removeFromSuperview];
        }
    }
    
    [_cells removeAllObjects];
    
    for (NSInteger index=0; index<_pageCount; index++)
    {
        [_cells addObject:[NSNull null]];
    }
    
    
    // 重置_scrollView的contentSize
    _scrollView.frame = CGRectMake(0, 0, _pageSize.width, _pageSize.height);
    _scrollView.contentSize = CGSizeMake(_pageSize.width * _pageCount,_pageSize.height);
    CGPoint theCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    _scrollView.center = theCenter;
    
    if (![_cells count]) {
        return;
    }
    [self setPagesAtContentOffset:_scrollView.contentOffset];//根据当前scrollView的offset设置cell
    [self refreshVisibleCellAppearance];//更新各个可见Cell的显示外貌
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark PagedFlowView API

- (UIView *)dequeueReusableCell{
    UIView *cell = [_reusableCells lastObject];
    if (cell)
    {
        [_reusableCells removeLastObject];
    }
    return cell;
}

- (void)scrollToPage:(NSUInteger)pageNumber {
    if (!self.dataSource || ![_cells count] || !self.delegate) {
        return;
    }
    if (pageNumber < _pageCount) {
        [_scrollView setContentOffset:CGPointMake(_pageSize.width * pageNumber, 0) animated:YES];
        [self setPagesAtContentOffset:_scrollView.contentOffset];
        [self refreshVisibleCellAppearance];
    }
}



////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark hitTest

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if ([self pointInside:point withEvent:event]) {
        CGPoint newPoint = CGPointZero;
        newPoint.x = point.x - _scrollView.frame.origin.x + _scrollView.contentOffset.x;
        newPoint.y = point.y - _scrollView.frame.origin.y + _scrollView.contentOffset.y;
        //        //NSLog(@"scrollView point  %@",[NSValue valueWithCGPoint:newPoint]);
        for (UIView * cell in _cells) {
            
            if (!cell || (NSObject *)cell == [NSNull null]) {
                continue;
            }
            CGPoint cellPoint = CGPointZero;
            cellPoint.x = newPoint.x - cell.frame.origin.x;
            cellPoint.y = newPoint.y - cell.frame.origin.y;
            
            //            //NSLog(@"cellPoint %@",[NSValue valueWithCGPoint:cellPoint]);
            
            if ([cell pointInside:cellPoint withEvent:event]) {
                return [cell hitTest:cellPoint withEvent:event];
            }
        }
        
        if ([_scrollView pointInside:newPoint withEvent:event]) {
            return [_scrollView hitTest:newPoint withEvent:event];
        }
        
        return _scrollView;
    }
    return nil;
}

#pragma mark - Reuse
- (void)queueReusableCell:(UIView *)cell{
    [_reusableCells addObject:cell];
}

- (void)removeCellAtIndex:(NSInteger)index{
    UIView *cell = [_cells objectAtIndex:index];
    if ((NSObject *)cell == [NSNull null]) {
        return;
    }
    [self queueReusableCell:cell];
    if (cell.superview) {
        [cell removeFromSuperview];
    }
    [_cells replaceObjectAtIndex:index withObject:[NSNull null]];
}

- (void)refreshVisibleCellAppearance{
    if (_minimumPageAlpha == 1.0 && _minimumPageScale == 1.0) {
        return;//无需更新
    }
    
    CGFloat offset = _scrollView.contentOffset.x;
    for (NSInteger i = _visibleRange.location; i < _visibleRange.location + _visibleRange.length; i++) {
        HomeDateCell *cell = [_cells objectAtIndex:i];
        CGFloat origin = cell.frame.origin.x;
        CGFloat delta = fabs(origin - offset);
        
        CGRect originCellFrame = CGRectMake(_pageSize.width * i, 0, _pageSize.width, _pageSize.height);//如果没有缩小效果的情况下的本该的Frame
        
        [UIView beginAnimations:@"CellAnimation" context:nil];
        if (delta < _pageSize.width) {
            cell.alpha = 1 - (delta / _pageSize.width) * (1 - _minimumPageAlpha);
            CGFloat inset = (_pageSize.width * (1 - _minimumPageScale)) * (delta / _pageSize.width)/2.0;
            cell.frame = UIEdgeInsetsInsetRect(originCellFrame, UIEdgeInsetsMake(inset, inset, inset, inset));
            //Load different DataSource
            if (delta< (_pageSize.width)/2) {
                cell.isSelected = YES;
            } else {
                cell.isSelected = NO;
            }
            
        } else {
            cell.alpha = _minimumPageAlpha;
            CGFloat inset = _pageSize.width * (1 - _minimumPageScale) / 2.0;
            cell.frame = UIEdgeInsetsInsetRect(originCellFrame, UIEdgeInsetsMake(inset, inset, inset, inset));
            cell.isSelected = NO;
        }
        cell.userInteractionEnabled = YES;
        
        [UIView commitAnimations];
    }
}

- (void)setPageAtIndex:(NSInteger)pageIndex {
    NSParameterAssert(pageIndex >= 0 && pageIndex < [_cells count]);
    UIView *cell = [_cells objectAtIndex:pageIndex];
    if ((NSObject *)cell == [NSNull null]) {
        cell = [_dataSource flowView:self cellForPageAtIndex:pageIndex];
        cell.userInteractionEnabled = NO;
        NSAssert(cell!=nil, @"datasource must not return nil");
        [_cells replaceObjectAtIndex:pageIndex withObject:cell];
        cell.frame = CGRectMake(_pageSize.width * pageIndex, 0, _pageSize.width, _pageSize.height);
        if (!cell.superview) {
            [_scrollView addSubview:cell];
        }
    }
}

- (void)setPagesAtContentOffset:(CGPoint)offset{
    if (!self.dataSource || ![_cells count]) {
        return;
    }
    
    //计算_visibleRange
    CGPoint startPoint = CGPointMake(offset.x - _scrollView.frame.origin.x, offset.y - _scrollView.frame.origin.y);
    CGPoint endPoint = CGPointMake(startPoint.x + self.bounds.size.width, startPoint.y + self.bounds.size.height);
    NSInteger startIndex = 0;
    for (int i =0; i < [_cells count]; i++) {
        if (_pageSize.width * (i +1) > startPoint.x) {
            startIndex = i;
            break;
        }
    }
    NSInteger endIndex = startIndex;
    for (NSInteger i = startIndex; i < [_cells count]; i++) {
        //如果都不超过则取最后一个
        if ((_pageSize.width * (i + 1) < endPoint.x && _pageSize.width * (i + 2) >= endPoint.x) || i+ 2 == [_cells count]) {
            endIndex = i + 1;//i+2 是以个数，所以其index需要减去1
            break;
        }
    }
    //可见页分别向前向后扩展一个，提高效率
    startIndex = MAX(startIndex - 1, 0);
    endIndex = MIN(endIndex + 1, [_cells count] - 1);
    
    _visibleRange.location = startIndex;
    _visibleRange.length = endIndex - startIndex + 1;
    
    NSLog(@"_visibleRange    %@",[NSValue valueWithRange:_visibleRange]);
    
    for (NSInteger i = startIndex; i <= endIndex; i++) {
        [self setPageAtIndex:i];
    }
    for (int i = 0; i < startIndex; i ++) {
        [self removeCellAtIndex:i];
    }
    for (NSInteger i = endIndex + 1; i < [_cells count]; i ++) {
        [self removeCellAtIndex:i];
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (!self.dataSource || ![_cells count] || !self.delegate) {
        return;
    }
    [self setPagesAtContentOffset:scrollView.contentOffset];
    [self refreshVisibleCellAppearance];
    NSInteger pageIndex;
    pageIndex = floor(_scrollView.contentOffset.x / _pageSize.width);
    _currentPageIndex = pageIndex;
    NSLog(@"_currentSelectedIndex    %ld",_currentPageIndex);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //如果有PageControl，计算出当前页码，并对pageControl进行更新
    NSInteger pageIndex;
    pageIndex = floor(_scrollView.contentOffset.x / _pageSize.width);
    if (self.delegate && [_delegate respondsToSelector:@selector(didScrollToPage:inFlowView:)]) {
        [self.delegate didScrollToPage:pageIndex inFlowView:self];
    }
    _currentPageIndex = pageIndex;
}

#pragma mark - FlowHeaderImageView
#if 0
- (void)flowHeaderImageView:(FlowHeaderImageView *)imageView didTapPhotoAtIndex:(int) index {
    //    //NSLog(@"selected At index %d",index);
    [self.animationTimer invalidate];
    
    if (imageView.index == _currentPageIndex) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(selectIndexPage:)]) {
            [self.delegate selectIndexPage:(int)_currentPageIndex];
        }
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(shouldShowSubViewAtIndex:inFlowView:)]) {
            [self scrollToPage:imageView.index];
            [self.delegate shouldShowSubViewAtIndex:imageView.index inFlowView:self];
        }
    }
}
#endif

@end
