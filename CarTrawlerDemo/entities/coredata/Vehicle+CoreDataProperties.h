//
//  Vehicle+CoreDataProperties.h
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//
//

#import "Vehicle+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Vehicle (CoreDataProperties)

+ (NSFetchRequest<Vehicle *> *)fetchRequest;

@property (nonatomic) BOOL airConditionInd;
@property (nonatomic) int16_t baggageQuantity;
@property (nullable, nonatomic, copy) NSString *code;
@property (nullable, nonatomic, copy) NSString *codeContext;
@property (nullable, nonatomic, copy) NSString *currencyCode;
@property (nonatomic) int16_t doorCount;
@property (nullable, nonatomic, copy) NSString *driveType;
@property (nullable, nonatomic, copy) NSString *estimatedTotalAmount;
@property (nullable, nonatomic, copy) NSString *fuelType;
@property (nullable, nonatomic, copy) NSString *passengerQuantity;
@property (nullable, nonatomic, copy) NSString *pictureURL;
@property (nullable, nonatomic, copy) NSString *rateTotalAmount;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *transmissionType;
@property (nullable, nonatomic, copy) NSString *vehMakeModel;
@property (nullable, nonatomic, retain) VehicleVendor *vehicleVendor;

@end

NS_ASSUME_NONNULL_END
