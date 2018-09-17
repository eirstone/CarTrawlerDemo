//
//  VehAvailRSCore.h
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "VehRentalCore.h"
#import "VehVendorAvail.h"

NS_ASSUME_NONNULL_BEGIN

@interface VehAvailRSCore : JSONModel

@property (nonatomic,strong) VehRentalCore* vehRentalCore;
@property (nonatomic,strong) NSArray<VehVendorAvail> *vehVendorAvails;

@end

NS_ASSUME_NONNULL_END
