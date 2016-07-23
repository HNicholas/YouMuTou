//
//  YMHomeTableHeadView.m
//  youMuTou
//
//  Created by Tao on 16/7/17.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "YMHomeTableHeadView.h"

@interface ScrollImageView : UIScrollView<UIScrollViewDelegate>

@property(nonatomic, strong) NSArray *imageNames;

- (void)createScrollImageView;

@end

#define SCROLL_VIEW_WIDTH self.frame.size.width
#define SCROLL_VIEW_HEIGHT self.frame.size.height

@implementation ScrollImageView
{
    UIPageControl *_pageControl;
}

- (void)createScrollImageView
{
    if (_imageNames.count != 0) {
        for (int i = 0; i < _imageNames.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageNames[i]]];
            imageView.frame = CGRectMake( SCROLL_VIEW_WIDTH*i, 0,SCROLL_VIEW_WIDTH, SCROLL_VIEW_HEIGHT);
            [self addSubview:imageView];
        }
        self.contentSize = CGSizeMake(SCROLL_VIEW_WIDTH*_imageNames.count, SCROLL_VIEW_HEIGHT);
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.frame = CGRectMake(100, SCROLL_VIEW_HEIGHT-30, 100, 30);
        _pageControl.numberOfPages = _imageNames.count;
        _pageControl.currentPage = 0;
        [_pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_pageControl];
    }
    self.delegate = self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [_pageControl setCurrentPage:offset.x / bounds.size.width];
}

- (void)pageTurn:(UIPageControl*)sender
{
    CGSize viewSize = self.frame.size;
    CGRect rect = CGRectMake(sender.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [self scrollRectToVisible:rect animated:YES];
}


@end


@interface YMHomeTableHeadView ()
@property(nonatomic, strong) ScrollImageView *scrollImageView;

@end

@implementation YMHomeTableHeadView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (ScrollImageView *)scrollImageView
{
    if (!_scrollImageView) {
        _scrollImageView = [[ScrollImageView alloc] init];
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"index1.jpg",@"index1.jpg",@"index1.jpg", nil];
        _scrollImageView.imageNames = array;
        _scrollImageView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-10);
        [_scrollImageView createScrollImageView];
        
    }
    return _scrollImageView;
}

- (void)initUI
{
    [self addSubview:self.scrollImageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollImageView.frame), SCROLL_VIEW_WIDTH, 10)];
    label.text = @"  规格 片/包 单包量(m³) 每方价格 操作";
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    [self addSubview:label];

}


@end
