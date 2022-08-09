//
//  ViewController.m
//  UICollectionView瀑布流
//
//  Created by 张佳乔 on 2022/8/9.
//

#import "ViewController.h"
#import "MyLayout.h"
#import "CircleLayout.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    // 普通layout布局类
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    layout.itemSize = CGSizeMake(120, 100);
//    layout.sectionInset = UIEdgeInsetsMake(50, 40, 60, 20);
    // 瀑布流layout布局类
    MyLayout *layout = [[MyLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // 圆layout布局类
//    CircleLayout *layout = [[CircleLayout alloc] init];
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 250 / 250.0 alpha:1];
    
    // 圆需要设置：
//    cell.layer.cornerRadius = cell.frame.size.width / 2;
//    cell.layer.masksToBounds = YES;
    
    return cell;
}

@end
