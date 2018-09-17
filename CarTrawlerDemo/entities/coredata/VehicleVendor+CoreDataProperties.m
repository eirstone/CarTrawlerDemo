//
//  VehicleVendor+CoreDataProperties.m
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//
//

#import "VehicleVendor+CoreDataProperties.h"

@implementation VehicleVendor (CoreDataProperties)

+ (NSFetchRequest<VehicleVendor *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"VehicleVendor"];
}

@dynamic id;
@dynamic vendorCode;
@dynamic vendorName;
@dynamic vehicle;

@end
