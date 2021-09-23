//
//  ViewController.m
//  algorithm_oc_parctice_app
//
//  Created by Danny on 2021/9/20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@(3),@(5),@(1),@(2),@(6),@(4),@(10),@(12),@(11),@(9),@(8)];
    NSArray *sortArray = [self shellSort:array];
    for (NSNumber *number in sortArray) {
        NSLog(@"number :%ld",[number integerValue]);
    }
}

/// 1.选择排序算法 时间复杂度 O(n ^ 2) 基本不用 太慢
-(NSArray *)selectSort:(NSArray *)array{
    NSMutableArray *arrM = [NSMutableArray array];
    [arrM addObjectsFromArray:array];
    /// [3,5,1,2,6,4]
    /// 1.先假设最小值的索引是i = 0 遍历一次找到最小值的下标 例如上面的数组2
    /// 让array[2]和array[i] 和array[2]交换
    for (NSInteger i = 0; i < arrM.count - 1; i ++) {
        NSInteger minIndex = i;
        for (NSInteger j = i + 1; j < arrM.count; j ++) {
            if([arrM[j] integerValue] < [arrM[minIndex] integerValue]){
                minIndex = j;
            }
        }
        // 交换位置
        [arrM exchangeObjectAtIndex:minIndex withObjectAtIndex:i];
    }
    return arrM;
}
/// 冒泡排序算法 O(n ^ 2) 基本不用
-(NSArray *)bubbleSort:(NSArray *)array{
    NSMutableArray *arrM = [NSMutableArray array];
    [arrM addObjectsFromArray:array];
    /// 冒泡的原理 相邻的两个元素比较 大数下沉
    for (NSInteger i = 0; i < arrM.count - 1; i ++) {
        for (NSInteger j = i + 1; j < arrM.count; j ++) {
            if ([arrM[i] integerValue] > [arrM[j] integerValue]) {/// 互换位置
                [arrM exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    return arrM;
}

/// 插入排序 有点像往前的冒泡排序 O(n ^ 2)
/// 实现原理 1.先抽出第i张牌(外层遍历拿到第i张牌)来2，遍历i之前的数，用j和j-1作比较，如果j 小于j -1的位置的数 进行交换
-(NSArray *)insertSort:(NSArray *)array{
    NSMutableArray *arrM = [NSMutableArray array];
    [arrM addObjectsFromArray:array];
    for (NSInteger i = 1; i < arrM.count; i ++) {
        for (NSInteger j = i; j > 0; j --) {
            if ([arrM[j] integerValue] < [arrM[j - 1] integerValue]) {
                /// 交换位置
                [arrM exchangeObjectAtIndex:j - 1 withObjectAtIndex:j];
            }
        }
    }
    return arrM;
}

/// 希尔排序 改进的插入排序 gap 抽出以gap为数组的 进行排序
/// 每次排完 gap -- 再以gap 抽出对应的数进行排序
/// knuth 序列 h = 1 h = 3*h + 1
/// 实践证明knuth序列效率要高一些
/// 希尔排序实践复杂度 O(n ^ 1.3)
-(NSArray *)shellSort:(NSArray *)array{
    NSMutableArray *arrM = [NSMutableArray array];
    [arrM addObjectsFromArray:array];
    int h = 1;
    while (h <= array.count/3) {
        h = h * 3 + 1;
    }
    for (int h = 4; h > 0; h --) {
        for (NSInteger i = h; i < arrM.count; i ++) {
            for (NSInteger j = i; j > h - 1; j -= h) {
                if ([arrM[j] integerValue] < [arrM[j - h] integerValue]) {/// 交换位置
                    [arrM exchangeObjectAtIndex:j - h withObjectAtIndex:j];
                }
            }
        }
    }
    return arrM;
}
@end
