//
//  ImageReviewViewController.m
//  ImageReview
//
//  Created by gyf on 16/5/3.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "ImageReviewViewController.h"
#import "UIImageCollectionViewCell.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface ImageReviewViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ImageCellClickDelegate>
{
    UIButton *_closeBtn;
}
@property (nonatomic, strong) UICollectionView *collectionContentView;
@property (nonatomic, strong) NSArray *imageArray;
@end
@implementation ImageReviewViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:(UIStatusBarAnimationFade)];
    self.imageArray = @[@"0.jpg",@"1.jpg",@"2.jpg"];
    [self buildCollectionView];
    _closeBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _closeBtn.frame = CGRectMake(0, 0, 44, 44);
    [_closeBtn setTitle:@"关闭" forState:(UIControlStateNormal)];
    [_closeBtn addTarget:self action:@selector(closeViewAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_closeBtn];
}
- (void)closeViewAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        [[UIApplication sharedApplication]setStatusBarHidden:NO withAnimation:(UIStatusBarAnimationFade)];
    }];
}
- (void)buildCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionContentView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
    self.collectionContentView.delegate = self;
    self.collectionContentView.dataSource = self;
    [self.collectionContentView registerClass:[UIImageCollectionViewCell class] forCellWithReuseIdentifier:@"imagecell"];
    self.collectionContentView.pagingEnabled = YES;
    [self.view addSubview:self.collectionContentView];
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImageCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"imagecell" forIndexPath:indexPath];
    cell.delegate = self;
    [cell setImage:self.imageArray[indexPath.row]];
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}
- (void)ImageCellDidClick
{
    _closeBtn.hidden = !_closeBtn.hidden;
}
@end
