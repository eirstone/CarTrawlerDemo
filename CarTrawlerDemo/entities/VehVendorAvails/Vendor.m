//
//  Vendor.m
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "Vendor.h"

@implementation Vendor

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"code": @"@Code",
                                                                  @"name": @"@Name"
                                                                  }];
}

@end
