//
//  VehicleVendor+CoreDataProperties.h
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//
//

#import "VehicleVendor+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface VehicleVendor (CoreDataProperties)

+ (NSFetchRequest<VehicleVendor *> *)fetchRequest;

@property (nonatomic) int16_t id;
@property (nullable, nonatomic, copy) NSString *vendorCode;
@property (nullable, nonatomic, copy) NSString *vendorName;
@property (nullable, nonatomic, retain) NSSet<Vehicle *> *vehicle;

@end

@interface VehicleVendor (CoreDataGeneratedAccessors)

- (void)addVehicleObject:(Vehicle *)value;
- (void)removeVehicleObject:(Vehicle *)value;
- (void)addVehicle:(NSSet<Vehicle *> *)values;
- (void)removeVehicle:(NSSet<Vehicle *> *)values;

@end

NS_ASSUME_NONNULL_END
