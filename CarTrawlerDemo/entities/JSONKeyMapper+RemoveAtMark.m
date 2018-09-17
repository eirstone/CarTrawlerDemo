//
//  JSONKeyMapper+RemoveAtMark.m
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "JSONKeyMapper+RemoveAtMark.h"
#import <Foundation/Foundation.h>

@implementation JSONKeyMapper (RemoveAtMark)

//+ (instancetype)mapperStartWithNoAtMark
//{
//    return [[self alloc] initWithModelToJSONBlock:^NSString *(NSString *keyName)
//            {
//                if (![keyName hasPrefix:@"@"]) {
//                    
//                    keyName = [NSString stringWithFormat:@"%@%@",[[keyName substringToIndex:1] uppercaseString],[keyName substringFromIndex:1] ];
//
//
//                    return keyName;
//                }
//                else{
//                    return [keyName substringFromIndex:1];
//                }
//            }];
//}

@end
