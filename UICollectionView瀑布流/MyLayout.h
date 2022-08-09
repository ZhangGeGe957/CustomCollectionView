//
//  MyLayout.h
//  UICollectionView瀑布流
//
//  Created by 张佳乔 on 2022/8/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) int itemCount;
@property (nonatomic, strong) NSMutableArray *attributeArray; // 自定义的配置数组

@end

NS_ASSUME_NONNULL_END
