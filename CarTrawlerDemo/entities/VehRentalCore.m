//
//  VehRentalCore.m
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "VehRentalCore.h"
#import "JSONKeyMapper.h"

@implementation VehRentalCore

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                       @"pickUpDateTime": @"@PickUpDateTime",
                                                       @"returnDateTime": @"@ReturnDateTime",
                                                       @"pickupLocation": @"PickUpLocation",
                                                       @"returnLocation": @"ReturnLocation"
                                                       }];
}

@end
