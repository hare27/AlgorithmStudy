//
//  main.m
//  Algorithm
//
//  Created by hare on 2017/4/13.
//  Copyright © 2017年 hare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sort.h"
#import "Swap.h"
#import "Arr-tool.h"

/** 测试排序*/
void sortTest();


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 排序
        sortTest();
        
    }
    return 0;
}

/** 测试排序*/
void sortTest(){
    
    // 数组长度
#define arrLen 10
    
    // 1. 初始化数据
    int arr[arrLen] = {0};
    initArr(arr, arrLen);
    
    // 2. 打印原始数据
    printf("原始数据:");
    printArr(arr, arrLen);
    
    // 3. 排序
    // 冒泡
    // bulleSort(arr, arrLen);
    // 快速
    quickSort(arr, arrLen);
    
    // 4. 打印结果
    printf("排序结果:");
    printArr(arr, arrLen);
}
