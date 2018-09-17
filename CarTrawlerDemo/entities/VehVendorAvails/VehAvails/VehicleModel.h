//
//  Vehicle.h
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "BaseModel.h"
#import "VehMakeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VehicleModel : JSONModel

@property NSString *airConditionInd;
@property NSString *transmissionType;
@property NSString *fuelType;
@property NSString *driveType;
@property NSString *passengerQuantity;
@property NSString *baggageQuantity;
@property NSString *code;
@property NSString *codeContext;
@property NSString *doorCount;
@property NSString *pictureURL;
@property VehMakeModel *vehMakeModel;

@end

NS_ASSUME_NONNULL_END
