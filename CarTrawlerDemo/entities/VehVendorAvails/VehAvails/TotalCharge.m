//
//  TotalCharge.m
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "TotalCharge.h"

@implementation TotalCharge

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"rateTotalAmount": @"@RateTotalAmount",
                                                                  @"estimatedTotalAmount": @"@EstimatedTotalAmount",
                                                                  @"currencyCode": @"@CurrencyCode"
                                                                  }];
}


@end
