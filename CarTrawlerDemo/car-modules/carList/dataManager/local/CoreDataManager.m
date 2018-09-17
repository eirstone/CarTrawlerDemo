//
//  CoreDataManager.m
//  CarTrawlerDemo
//
//  Created by lei on 15/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

+ (id)sharedManager {
    static CoreDataManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

@end
