//
//  VehAvail.m
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "VehAvail.h"

@implementation VehAvail

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"status": @"@Status",
                                                                  @"vehicle": @"Vehicle",
                                                                  @"totalCharge": @"TotalCharge"
                                                                  }];
}

@end
