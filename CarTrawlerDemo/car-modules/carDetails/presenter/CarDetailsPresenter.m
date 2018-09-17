//
//  CarDetailsPresenter.m
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "CarDetailsPresenter.h"

@implementation CarDetailsPresenter

- (void)updateView{
    [self.view showCarDetailsScreen];
}

- (NSString*)getCarInformation{
    
//    @property (nonatomic) BOOL airConditionInd;
//    @property (nonatomic) int16_t baggageQuantity;
//    @property (nullable, nonatomic, copy) NSString *code;
//    @property (nullable, nonatomic, copy) NSString *codeContext;
//    @property (nullable, nonatomic, copy) NSString *currencyCode;
//    @property (nonatomic) int16_t doorCount;
//    @property (nullable, nonatomic, copy) NSString *driveType;
//    @property (nullable, nonatomic, copy) NSString *estimatedTotalAmount;
//    @property (nullable, nonatomic, copy) NSString *fuelType;
//    @property (nullable, nonatomic, copy) NSString *passengerQuantity;
//    @property (nullable, nonatomic, copy) NSString *pictureURL;
//    @property (nullable, nonatomic, copy) NSString *rateTotalAmount;
//    @property (nullable, nonatomic, copy) NSString *status;
//    @property (nullable, nonatomic, copy) NSString *transmissionType;
//    @property (nullable, nonatomic, copy) NSString *vehMakeModel;
    
    NSString *aircondition = self.car.airConditionInd? @"true" : @"false";

    return [NSString stringWithFormat:@"CarMakeModel - %@\nFuelType - %@\nDriveType - %@\nPassengerQuantity - %@\nbaggageQuantity - %d\nairConditionInd - %@",self.car.vehMakeModel,self.car.fuelType,self.car.driveType,self.car.passengerQuantity,self.car.baggageQuantity,aircondition];
    
}

- (NSString*)getCarviewTitle{
    return self.car.vehMakeModel;
}

- (NSString*)getCarPicturalUrl{
    return self.car.pictureURL;
}


@end
