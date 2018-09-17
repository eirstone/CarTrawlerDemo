//
//  VehAvail.h
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "TotalCharge.h"
#import "VehicleModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol VehAvail;

@interface VehAvail : JSONModel

@property NSString *status;
@property VehicleModel *vehicle;
@property TotalCharge *totalCharge;

@end

NS_ASSUME_NONNULL_END
