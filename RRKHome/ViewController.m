//
//  ViewController.m
//  RRKHome
//
//  Created by 杰杨 on 2017/8/3.
//  Copyright © 2017年 RRK. All rights reserved.
//

#import "ViewController.h"
#import "RRKHomeCollectionLayout.h"
#import "RRKHomeCellOne.h"
#import "RRKHomeCellTwo.h"
#import "RRKHomeCellThree.h"
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
/**
 *  自定义布局
 **/
@property (nonatomic,strong)RRKHomeCollectionLayout * calculatorLayout;
@end

@implementation ViewController

-(RRKHomeCollectionLayout *)calculatorLayout
{
    if(!_calculatorLayout){
        _calculatorLayout=[[RRKHomeCollectionLayout alloc] init];
    }
    return _calculatorLayout;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self handleViewLayout];
}

- (void)handleViewLayout
{
    [_collectionView setCollectionViewLayout:self.calculatorLayout];
    _collectionView.delaysContentTouches = false;
    _collectionView.showsVerticalScrollIndicator=NO;
    _collectionView.showsHorizontalScrollIndicator=NO;
    //注册cell
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RRKHomeCellOne class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([RRKHomeCellOne class])];
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RRKHomeCellTwo class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([RRKHomeCellTwo class])];
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RRKHomeCellThree class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([RRKHomeCellThree class])];
}

#pragma mark - CollectionView的Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 1) {
        return 10;
    }else if (section == 2)
    {
        return 3;
    }else if (section == 3)
    {
        return 10;
    }
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 || indexPath.section == 2) {
        RRKHomeCellOne *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRKHomeCellOne class]) forIndexPath:indexPath];
        cell.imageView.backgroundColor = randomColor;
        return cell;
    }else if (indexPath.section == 1)
    {
        RRKHomeCellThree *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRKHomeCellThree class]) forIndexPath:indexPath];
        cell.imageView.backgroundColor = randomColor;
        return cell;
    }else if (indexPath.section == 3)
    {
        RRKHomeCellTwo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRKHomeCellTwo class]) forIndexPath:indexPath];
        cell.imageView.backgroundColor = randomColor;
        return cell;
    }
    
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld   %ld",indexPath.section,indexPath.item);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
