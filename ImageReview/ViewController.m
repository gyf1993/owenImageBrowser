//
//  ViewController.m
//  ImageReview
//
//  Created by gyf on 16/5/3.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "ViewController.h"
#import "ImageReviewViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    [btn setTitle:@"相册" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(imageReviewAction) forControlEvents:(UIControlEventTouchUpInside)];
    btn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
    [[UIApplication sharedApplication]setStatusBarHidden:NO withAnimation:(UIStatusBarAnimationFade)];
}

- (void)imageReviewAction
{
    ImageReviewViewController *vc = [[ImageReviewViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
