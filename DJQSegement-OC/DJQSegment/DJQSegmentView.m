//
//  DJQSegmentView.m
//  DJQSegement-OC
//
//  Created by kezhiyou on 2017/5/19.
//  Copyright © 2017年 daijuqing. All rights reserved.
//

#import "DJQSegmentView.h"




@implementation DJQSegmentView

{
    NSArray *_titles;
    NSArray *_childs;
    DJQTitleView *_titleView;
    DJQContentView *_contentView;
    
}


- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titles withChilds:(NSArray *)childs{
    if (self = [super initWithFrame:frame]) {
        
        _titles = titles;
        _childs = childs;

        [self setupUI];
    }
    
    return self;
}


- (void)setupUI{
    
    [self setupTitles];
    [self setupChilds];
    
}

- (void)setupTitles{
    
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, 44);
    
    _titleView = [[DJQTitleView alloc]initWithFrame:frame withTitles:_titles];
    _titleView.delegate  = self;

    [self addSubview:_titleView];
}

- (void)setupChilds{
    CGRect frame = CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44);
    _contentView = [[DJQContentView alloc]initWithFrame:frame withChilds:_childs];
    _contentView.delegate = self;
    [self addSubview:_contentView];

}

- (void)titlViewDelegate:(NSInteger)index{
    
    NSLog(@"titlViewDelegate%ld",index);
    _contentView.currentIndex = index;
}

- (void)contentViewDelegate:(NSInteger)index{
    NSLog(@"contentViewDelegate%ld",index);
    _titleView.targetIndex = index;
}

@end
