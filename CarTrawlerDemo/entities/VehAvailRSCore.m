//
//  VehAvailRSCore.m
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "VehAvailRSCore.h"

@implementation VehAvailRSCore

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"vehRentalCore": @"VehRentalCore",
                                                                  @"vehVendorAvails": @"VehVendorAvails"
                                                                  }];
}

@end
