//
//  DJQSegmentView.h
//  DJQSegement-OC
//
//  Created by kezhiyou on 2017/5/19.
//  Copyright © 2017年 daijuqing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DJQTitleView.h"
#import "DJQContentView.h"



@interface DJQSegmentView : UIView<TitleviewDelegate,ContentViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titles withChilds:(NSArray *)childs;

@end
