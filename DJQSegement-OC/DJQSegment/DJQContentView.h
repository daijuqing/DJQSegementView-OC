//
//  DJQContentView.h
//  DJQSegement-OC
//
//  Created by kezhiyou on 2017/5/19.
//  Copyright © 2017年 daijuqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJQTitleView.h"

@protocol ContentViewDelegate <NSObject>

- (void)contentViewDelegate:(NSInteger)index;


@end

@interface DJQContentView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic , assign)NSInteger currentIndex;
@property (nonatomic , weak)id<ContentViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame withChilds:(NSArray *)childs;
@end
