//
//  PickUpLocation.m
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "PickUpLocation.h"

@implementation PickUpLocation

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"name": @"@Name"
                                                                  }];
}


@end
