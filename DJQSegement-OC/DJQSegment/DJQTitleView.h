//
//  DJQTitleView.h
//  DJQSegement-OC
//
//  Created by kezhiyou on 2017/5/19.
//  Copyright © 2017年 daijuqing. All rights reserved.
//



#import <UIKit/UIKit.h>


@protocol TitleviewDelegate <NSObject>


- (void)titlViewDelegate:(NSInteger)index;

@end


@interface DJQTitleView : UIView
{
    CGFloat _titleHeight;
    UIColor *_normalColor;
    UIColor *_seletedColor;
    CGFloat _forntSize;
    BOOL _isScrollEnable;
    CGFloat _iteamMargin;
    BOOL _isShowScrollLine;
    CGFloat _scrollLineHeight;
    UIColor *_scrollLineColor;
}



@property (nonatomic , strong)UIScrollView *scrollView;
@property (nonatomic , weak)id<TitleviewDelegate> delegate;
@property (nonatomic ,assign)NSInteger targetIndex;

- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titles;
@end
