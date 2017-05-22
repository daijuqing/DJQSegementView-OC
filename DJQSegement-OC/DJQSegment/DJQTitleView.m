//
//  DJQTitleView.m
//  DJQSegement-OC
//
//  Created by kezhiyou on 2017/5/19.
//  Copyright © 2017年 daijuqing. All rights reserved.
//

#import "DJQTitleView.h"

@implementation DJQTitleView
{
    NSArray *_titles;
    NSMutableArray *_titlLabels;
    NSInteger _currentIndex;
}


- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titles{
    if ( self = [super initWithFrame:frame]) {
        
        _currentIndex = 0;
        _titles = titles;
        _isScrollEnable = YES;
        _seletedColor = [UIColor orangeColor];
        _normalColor = [UIColor blackColor];
        _forntSize = 14;
        _iteamMargin = 30;
        [self setupUI];
        
    }
    return  self;
}




- (void)setTargetIndex:(NSInteger)targetIndex{
    _targetIndex = targetIndex;
    
    
    UILabel *targetLabel = _titlLabels[_targetIndex];
    [self titleClickAction:targetLabel];
}

- (void)setupUI{
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];

    
    [self addSubview:_scrollView];
    _scrollView.showsHorizontalScrollIndicator = false;
    _scrollView.bounces = false;
    
    _titlLabels = [[NSMutableArray alloc]init];
    for (NSInteger i = 0 ; i < _titles.count; i ++)
    {

        UILabel *label = [[UILabel alloc]init];
        label.tag = i;
        label.textColor = i == 0?_seletedColor:_normalColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = _titles[i];
        label.font = [UIFont systemFontOfSize:_forntSize];
        label.userInteractionEnabled = YES;
        [_scrollView addSubview:label];
        [_titlLabels addObject:label];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleClick:)];
        [label addGestureRecognizer:tap];
        
    }
    
    
    
    NSInteger i = 0;

   
    for (UILabel *label in _titlLabels)
    {
        
        
        CGFloat w = 0;
        CGFloat h = self.frame.size.height;
        CGFloat x = 0;
        CGFloat y = 0;
        if (_isScrollEnable == NO)
        {
            
            w = self.frame.size.width / _titles.count;
            x = i * w + _iteamMargin * .5;
            
        }
        else
        {
            NSDictionary *attDic = @{NSFontAttributeName:label.font};
            w = [label.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:attDic context:nil].size.width;
            if ( i == 0)
            {
                
                x = _iteamMargin * 0.5;
                NSLog(@"%lf",x);
                
            }
            else
            {
                UILabel *preLabel = _titlLabels[i - 1];
                x = preLabel.frame.origin.x + preLabel.frame.size.width + _iteamMargin * .5;
            }
            

            
        }
        

        CGRect labelFrame = CGRectMake(x, y, w, h);
        label.frame = labelFrame;
        i ++;

    }
    UILabel *lastlabel = [_titlLabels lastObject];
    CGFloat contentW = lastlabel.frame.origin.x + lastlabel.frame.size.width + _iteamMargin * .5;
    _scrollView.contentSize = CGSizeMake(contentW, 0);

}

- (void)titleClickAction:(UILabel *)targetLabel{
    if (_currentIndex == targetLabel.tag) {
        return;
    }
    
    UILabel *currentLabel = _titlLabels[_currentIndex];
    currentLabel.textColor = _normalColor;
    targetLabel.textColor = _seletedColor;
    
    if (_isScrollEnable) {
        
        CGFloat offsetX = targetLabel.center.x - _scrollView.frame.size.width / 2;
        NSLog(@"%lf",offsetX);
        if (offsetX < 0) {
            offsetX = 0;
        }
        
        
        //如果偏移量大于最大可以偏移量
        if (offsetX > _scrollView.contentSize.width - _scrollView.bounds.size.width) {
            
            offsetX = _scrollView.contentSize.width - _scrollView.frame.size.width;
            
        }
        
        [UIView animateWithDuration:.25 animations:^{
            [_scrollView setContentOffset:CGPointMake(offsetX, 0)];
        }];
        
    }
    
    _currentIndex = targetLabel.tag;
    [self.delegate titlViewDelegate:_currentIndex];
}

- (void)titleClick:(UITapGestureRecognizer *)tap{
    UILabel *targetLabel = (UILabel *)tap.view;
    
    [self titleClickAction:targetLabel];
}





@end
