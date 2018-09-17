//
//  Vehicle.m
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "VehicleModel.h"

@implementation VehicleModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"airConditionInd": @"@AirConditionInd",
                                                                  @"transmissionType": @"@TransmissionType",
                                                                  @"fuelType": @"@FuelType",
                                                                  @"driveType": @"@DriveType",
                                                                  @"passengerQuantity": @"@PassengerQuantity",
                                                                  @"baggageQuantity": @"@BaggageQuantity",
                                                                  @"codeContext": @"@CodeContext",
                                                                  @"code": @"@Code",
                                                                  @"doorCount": @"@DoorCount",
                                                                  @"pictureURL": @"PictureURL",
                                                                  @"vehMakeModel": @"VehMakeModel"
                                                                  }];
}


@end
