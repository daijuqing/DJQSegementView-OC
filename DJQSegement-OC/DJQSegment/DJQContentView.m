//
//  DJQContentView.m
//  DJQSegement-OC
//
//  Created by kezhiyou on 2017/5/19.
//  Copyright © 2017年 daijuqing. All rights reserved.
//

#import "DJQContentView.h"
#import "UIColor+Category.h"

#define kCollectionViewcell @"kCollectionViewcell"


@implementation DJQContentView
{
    UICollectionView *_collectionView;
    NSArray *_childs;
}


- (instancetype)initWithFrame:(CGRect)frame withChilds:(NSArray *)childs{
    if ( self = [super initWithFrame:frame]) {
     
        self.backgroundColor = [UIColor redColor];
        _childs = childs;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing  = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCollectionViewcell];
        [self addSubview:_collectionView];
        
    }
    return  self;
}


- (void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    NSLog(@"current%ld",currentIndex);
    [_collectionView setContentOffset:CGPointMake(self.frame.size.width * _currentIndex, 0)];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _childs.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewcell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor randomColor];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger index = offsetX / self.frame.size.width;
    
    [self.delegate contentViewDelegate:index];
}

@end
