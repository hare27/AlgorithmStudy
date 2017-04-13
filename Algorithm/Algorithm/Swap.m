//
//  UIColor+sort.m
//  Algorithm
//  交换两个数的值
//  Created by hare on 2017/4/13.
//  Copyright © 2017年 hare. All rights reserved.
//
#import "Swap.h"

/** 交换两个数的值:利用位移方法实现*/
void swap(int *a,int *b){
    *b = (long)((long)(*a)<< 32|(*a=*b)) >> 32;
}
/** 交换两个数的值:利用加减方法实现*/
void swap1(int *a,int *b){
    *a = *a + *b;
    *b = *a - *b;
    *a = *a - *b;
}
/** 交换两个数的值:利用异或方法实现*/
void swap2(int *a,int *b){
    *a = *a ^ *b;
    *b = *a ^ *b;
    *a = *a ^ *b;
}
/** 交换两个数的值:利用中间变量实现*/
void swap3(int *a,int *b){
    int t = *a;
    *a = *b;
    *b = t;
}
