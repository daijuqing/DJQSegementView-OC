//
//  ViewController.m
//  DJQSegement-OC
//
//  Created by kezhiyou on 2017/5/19.
//  Copyright © 2017年 daijuqing. All rights reserved.
//

#import "ViewController.h"
#import "DJQSegmentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSMutableArray *childsVcs = [[NSMutableArray alloc]init];
    NSArray *titles = @[@"游戏",@"新闻",@"本地",@"新闻",@"本地",@"新闻",@"本地本地本地",@"新闻新闻新闻",@"本地",@"新闻",@"本地本地本地本地",@"新闻",@"本地"];
//    NSArray *titles = @[@"游戏",@"新闻",@"本地",@"新闻"];
    for (NSInteger i = 0 ; i < titles.count; i ++) {
        
        UIViewController *vc = [[UIViewController alloc]init];
        [childsVcs addObject:vc];
        [self addChildViewController:vc];
        
    }
    
    CGRect frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    DJQSegmentView *segmentView = [[DJQSegmentView alloc]initWithFrame:frame withTitles:titles withChilds:childsVcs];
    [self.view addSubview:segmentView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
