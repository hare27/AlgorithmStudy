//
//  Sort.m
//  Algorithm
//
//  Created by hare on 2017/4/13.
//  Copyright © 2017年 hare. All rights reserved.
//

#import "Sort.h"
#import "Swap.h"

/** 冒泡排序*/
void bulleSort(int *arr,int length){
    for (int i = 0; i < length ; i++) {
        for (int j = 0; j < length - i - 1; j++) {
            if (arr[j] > arr[j+1]) {
                swap3(arr+j, arr+j+1);
            }
        }
    }
}
/** 快速排序*/
void quickSort(int *arr,int len){
    // 推出条件
    if (len <= 1) {
        return;
    }
    int r = len - 1 ;
    int l = 0;
    while (l < r) {
        while (l < r && arr[l] <= arr[r]) {
            r--;
        }
        swap(arr+l, arr+r);
        while (l < r && arr[l] <= arr[r]) {
            l++;
        }
        swap(arr+l, arr+r);
    }
    quickSort(arr, l);
    quickSort(arr+l+1, len-l-1);
    
}
