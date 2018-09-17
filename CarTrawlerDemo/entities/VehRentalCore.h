//
//  VehRentalCore.h
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "BaseModel.h"
#import "PickUpLocation.h"
#import "ReturnLocation.h"

NS_ASSUME_NONNULL_BEGIN

@interface VehRentalCore : JSONModel

@property (nonatomic,copy) NSString *pickUpDateTime;
@property (nonatomic,copy) NSString *returnDateTime;
@property (nonatomic,copy) PickUpLocation *pickupLocation;
@property (nonatomic,copy) ReturnLocation *returnLocation;

@end

NS_ASSUME_NONNULL_END
