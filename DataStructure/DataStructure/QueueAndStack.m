//
//  NSObject+QQDecrypted.m
//  DataStructure
//
//  Created by hare on 2017/4/13.
//  Copyright © 2017年 hare. All rights reserved.
//

#import "QueueAndStack.h"
#import "Arr-tool.h"

#pragma mark - 结构体定义
struct queue {
    int data[101];
    int head;
    int tail;
};

struct stack {
    int data[101];
    int top;
};

#pragma mark - 队列相关方法
/** 向队列中添加一个数据*/
void addDataToQueue(struct queue *q,int data){
    (*q).data[(*q).tail++] = data;
}

/**
 向队列中添加一组数据

 @param q 目标队列
 @param len 添加数据的长度
 @param ... 数据
 */
void addDatasToQueue(struct queue *q,int len,...){
    // 参数列表
    va_list list;
    // 开始获取参数列表
    va_start(list, len);
    int arg = 0;
    for (int i = 0; i < len; i++) {
        // 获取参数
        arg = va_arg(list, int);
        // 添加到队列
        addDataToQueue(q, arg);
    }
    // 结束
    va_end(list);
}
/** 从队列中移除一个数据*/
int removeDataForQueue(struct queue *q){
    return (*q).data[(*q).head++];
}
/** 统计队列的数据个数*/
int countForQueue(struct queue q){
    return q.tail-q.head;
}
/** 打印队列数据*/
void printQueue(struct queue q){
    printArr(q.data+q.head, countForQueue(q));
}

#pragma mark - 栈相关方法
/** 入栈*/
void addDataToStack(struct stack *s,int data){
    (*s).data[(*s).top++] = data;
}
void addDatasToStack(struct stack *s,int *datas,int length){
    for (int i = 0; i<length; i++) {
        addDataToStack(s, datas[i]);
    }
}
/** 出栈*/
int removeDataForStack(struct stack *s){
    return (*s).data[--(*s).top];
}
/** 获取栈顶数据*/
int getDataForStack(struct stack s){
    return s.data[s.top-1];
}
/** 判断数据个数*/
int countForStack(struct stack s){
    return s.top;
}
/** 打印栈数据*/
void printStack(struct stack s){
    printArr(s.data, countForStack(s));
}

#pragma mark - 主要方法
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
/** qq解密:队列版*/
void qqDecryptedForQueue(){
    // 0. 准备数据
    int result[9] = {0};
    int num = 0;
    // 初始化
    struct queue q;
    q.head = 0;
    q.tail = 0;
    // 添加数据
    addDatasToQueue(&q,9,6,3,1,7,5,8,9,2,4);
    // 1. 解密
    while (countForQueue(q)) {
        result[num++] = removeDataForQueue(&q);
        if (countForQueue(q)) {
            addDataToQueue(&q, removeDataForQueue(&q));
        }
    }
    
    // 2. 打印结果
    printArr(result, num);
}



/** 回文判断:stack*/
void palindrome(){

    // 0. 初始化
    char ch[101] = {'a','h','a','h','a'};
//    char ch[101] = {'a','h','h','a'};
//    char ch[101] = {'b','h','h','a'};
//    char ch[101] = {'a','b','h','h','a'};
    struct stack s;
    s.top = 0;
    long len = strlen(ch);
    
    // 1. 入栈
    long mid = strlen(ch) / 2;
    for (int i = 0; i < mid; i++) {
        addDataToStack(&s, ch[i]);
    }
    // 2. 验证
    for (long i = (len%2==0 ? mid : mid + 1); i < len; i++) {

        if (ch[i] != getDataForStack(s)) {
            break;
        }else{
            removeDataForStack(&s);
        }
    }
    // 3. 输出结果
    if (countForStack(s) == 0) {
//        printf("\n是回文");
        NSLog(@"\n是回文");
    }else{
//        printf("\n不是回文");
        NSLog(@"\n不是回文");
    }
}
/**
 打牌
 
 @param q 打牌的对象
 @param book 记录桌面有哪些牌的数组
 @param s 桌面
 */
void outCard(struct queue *q,int *book,struct stack *s){
    
    int t = removeDataForQueue(q);
    // 判断桌面是否有这张牌
    if (book[t]) {
        // 牌已有，就赢牌
        addDataToQueue(q, t);
        while (getDataForStack(*s) != t) {
            book[getDataForStack(*s)] = 0;
            addDataToQueue(q, removeDataForStack(s));
        }
        book[getDataForStack(*s)] = 0;
        addDataToQueue(q, removeDataForStack(s));
        
    }else{
        // 牌没有就将牌放入桌面并记录
        addDataToStack(s, t);
        book[t] = 1;
    }
}
/** 小猫钓鱼*/
void kitteFishing(){
    // 0. 初始化
    struct queue q1,q2;
    q1.head = 0;
    q1.tail = 0;
    q2.head = 0;
    q2.tail = 0;
    struct stack s;
    s.top = 0;
    // 记录桌面牌的数组
    int book[10] = {0};
    
    // 1. 数据录入
    addDatasToQueue(&q1,6,2,4,1,2,5,6);
    addDatasToQueue(&q2,6,3,1,3,5,6,4);
    
    // 2. 打牌
    while (countForQueue(q1) && countForQueue(q2)) {
        // q1 打牌
        outCard(&q1, book, &s);
        // 如果q1没牌了，本局结束
        if (countForQueue(q1) == 0) {
            break;
        }
        outCard(&q2, book, &s);
    }
    
    // 输出结果
    printQueue(q1);
    printQueue(q2);
    printStack(s);
    
}

















