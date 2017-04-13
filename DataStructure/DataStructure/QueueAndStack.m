//
//  NSObject+QQDecrypted.m
//  DataStructure
//
//  Created by hare on 2017/4/13.
//  Copyright © 2017年 hare. All rights reserved.
//

#import "QueueAndStack.h"
#import "Arr-tool.h"

/** qq解密*/
void qqDecrypted(){
    // 0. 准备
    int q[102] = {6,3,1,7,5,8,9,2,4};
    int head = 0;
    int tail = 9;
    int result[9] = {0};
    int num = 0;
    
    // 1. 解密
    while (head < tail) {
        // 出列一个
        result[num++] = q[head++];
        // 判断是否结束
        if (head < tail) {
            q[tail++] = q[head++];
        }
    }
    // 2. 打印结果
    // 正确结果为615947283
    printArr(result, num);
}
