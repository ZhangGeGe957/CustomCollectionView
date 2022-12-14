//
//  CircleLayout.m
//  UICollectionView瀑布流
//
//  Created by 张佳乔 on 2022/8/9.
//

#import "CircleLayout.h"

@implementation CircleLayout

- (void)prepareLayout {
    
    [super prepareLayout];
    
    //获取item个数
    _itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    _attributeArray = [[NSMutableArray alloc] init];
    
    //先设定大圆的半径 取长和宽最短的
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height) / 2;
    
    //计算圆心的位置
    CGPoint center = CGPointMake(self.collectionView.frame.size.width / 2, self.collectionView.frame.size.height / 2);
    
    //设置每个item的大小为50 * 50，半径为25
    for (int i = 0; i < _itemCount; i++) {
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        //设置item大小
        attris.size = CGSizeMake(50, 50);
        
        //计算每个item的圆心位置
        float x = center.x + cosf(2 * M_PI / _itemCount * i) * (radius - 25);
        float y = center.y + sinf(2 * M_PI / _itemCount * i) * (radius - 25);
    
        attris.center = CGPointMake(x, y);
        [_attributeArray addObject:attris];
    }
}

//设置内容区域大小
- (CGSize)collectionViewContentSize {
    return self.collectionView.frame.size;
}

//返回设置数组
- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributeArray;
}

@end
