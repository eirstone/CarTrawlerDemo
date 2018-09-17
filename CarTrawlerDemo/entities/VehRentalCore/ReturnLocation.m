//
//  ReturnLocation.m
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "ReturnLocation.h"

@implementation ReturnLocation

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"name": @"@Name"
                                                                  }];
}


@end
