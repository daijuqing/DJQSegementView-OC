//
//  UIColor+Category.m
//  DJQSegement-OC
//
//  Created by kezhiyou on 2017/5/22.
//  Copyright © 2017年 daijuqing. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)
+ (UIColor *)randomColor {
    //detail implementation
    //arc4random() % 78 will return a number between 0 and 77, for example.
    CGFloat hue = arc4random() % 100 / 100.0; //色调：0.0 ~ 1.0
    CGFloat saturation = (arc4random() % 50 / 100) + 0.5; //饱和度：0.5 ~ 1.0
    CGFloat brightness = (arc4random() % 50 / 100) + 0.5; //亮度：0.5 ~ 1.0
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
