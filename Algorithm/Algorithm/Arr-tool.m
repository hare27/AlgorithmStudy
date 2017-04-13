//
//  arr-tool.m
//  Algorithm
//  数组工具类
//  Created by hare on 2017/4/13.
//  Copyright © 2017年 hare. All rights reserved.
//

#import "Arr-tool.h"
#import <Foundation/Foundation.h>

/** 初始化数组，元素为0-99的随机数*/
void initArr(int *arr,int length){
    for (int i = 0; i < length; i++) {
        arr[i] = arc4random()%99;
    }
}
/** 打印数组*/
void printArr(int *arr,int length){
    printf("[");
    for (int i = 0; i < length; i++) {
        printf("%d",arr[i]);
        if (i < length - 1) {
            printf(",");
        }
    }
    printf("]\n");
}
