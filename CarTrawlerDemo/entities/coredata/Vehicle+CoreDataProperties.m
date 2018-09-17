//
//  Vehicle+CoreDataProperties.m
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//
//

#import "Vehicle+CoreDataProperties.h"

@implementation Vehicle (CoreDataProperties)

+ (NSFetchRequest<Vehicle *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Vehicle"];
}

@dynamic airConditionInd;
@dynamic baggageQuantity;
@dynamic code;
@dynamic codeContext;
@dynamic currencyCode;
@dynamic doorCount;
@dynamic driveType;
@dynamic estimatedTotalAmount;
@dynamic fuelType;
@dynamic passengerQuantity;
@dynamic pictureURL;
@dynamic rateTotalAmount;
@dynamic status;
@dynamic transmissionType;
@dynamic vehMakeModel;
@dynamic vehicleVendor;

@end
