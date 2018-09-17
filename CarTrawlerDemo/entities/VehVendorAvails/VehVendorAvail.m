//
//  VehVendorAvail.m
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "VehVendorAvail.h"

@implementation VehVendorAvail

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"vendor": @"Vendor",
                                                                  @"vehAvails": @"VehAvails"
                                                                  }];
}

@end
