//
//  StoreGatheringCollectionLayout.m
//  RRKShop
//
//  Created by 杰杨 on 2017/8/3.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import "RRKHomeCollectionLayout.h"
#define SCREEN_WIDTH    (CGFloat)[UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   (CGFloat)[UIScreen mainScreen].bounds.size.height
@interface RRKHomeCollectionLayout ()
@property(nonatomic,strong)NSMutableArray * sectionOneAttributes;
@property (nonatomic, assign) CGFloat totalHeight;
@end
@implementation RRKHomeCollectionLayout
-(NSMutableArray *)sectionOneAttributes
{
    if(!_sectionOneAttributes){
        _sectionOneAttributes=[[NSMutableArray alloc] init];
    }
    return _sectionOneAttributes;
}

-(void)prepareLayout
{
    [super prepareLayout];
    self.totalHeight = 0;
    [self.sectionOneAttributes removeAllObjects];

    NSInteger sectionsCount = [self.collectionView numberOfSections];
    
    for (int i = 0; i < sectionsCount; i++) {
        NSInteger count =[self.collectionView numberOfItemsInSection:i];
        for (int j=0; j<count; j++) {
            NSIndexPath *  indexPath =[NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes * attrs=[self layoutAttributesForItemAtIndexPath:indexPath];
            [self.sectionOneAttributes addObject:attrs];

        }
    }
    
}

-(CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.bounds.size.width, self.totalHeight);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.sectionOneAttributes;
}



-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{

    UICollectionViewLayoutAttributes * attrs=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    NSInteger i=indexPath.item;
    CGFloat y = self.totalHeight;
    switch (indexPath.section) {
        case 0:
        {
            
            CGFloat itemHeight = 140.f;
            attrs.frame = CGRectMake(0, y, SCREEN_WIDTH, itemHeight);
            self.totalHeight += itemHeight;
        }
            break;
        case 1:
        {
            CGFloat itemHeight = 90.f;
            if (i < 5) {
                attrs.frame = CGRectMake(i*(SCREEN_WIDTH/5), y, SCREEN_WIDTH/5, itemHeight);
            }else
            {
                attrs.frame = CGRectMake((i-5)*(SCREEN_WIDTH/5), y+itemHeight, SCREEN_WIDTH/5, itemHeight);
            }
            
            if (indexPath.item == [self.collectionView numberOfItemsInSection:indexPath.section] - 1) {
                self.totalHeight += itemHeight+itemHeight;
            }
            
        }
            break;
        case 2:
        {
            CGFloat itemHeight = 240.f;
            if (indexPath.item == 0) {
                attrs.frame = CGRectMake(0, y, SCREEN_WIDTH/2, itemHeight);
            }else if (indexPath.item == 1)
            {
                attrs.frame = CGRectMake(SCREEN_WIDTH/2, y, SCREEN_WIDTH/2, itemHeight/2);
            }else if (indexPath.item == 2)
            {
                attrs.frame = CGRectMake(SCREEN_WIDTH/2, y+itemHeight/2, SCREEN_WIDTH/2, itemHeight/2);
            }
            if (indexPath.item == [self.collectionView numberOfItemsInSection:indexPath.section] - 1) {
                self.totalHeight += itemHeight;
            }
            
        }
            break;
        case 3:
        {
            NSInteger per =(i+1)%2;
            CGFloat itemWidth = (SCREEN_WIDTH-24)/2;
            CGFloat itemHeight = 240;
            NSInteger lines = i/2;
            if (per == 0)
            {
             attrs.frame = CGRectMake(8+8+itemWidth,y + 10 + lines*itemHeight + lines*8, itemWidth, itemHeight);
                
            }else
            {
              attrs.frame = CGRectMake(8, y + 10 + lines*itemHeight + lines*8, itemWidth, itemHeight);
            }
            if (indexPath.item == [self.collectionView numberOfItemsInSection:indexPath.section] - 1) {
                self.totalHeight += (attrs.frame.origin.y-self.totalHeight)+itemHeight;
            }
        }
            break;
        default:
            break;
    }
    
    return attrs;
}
@end
