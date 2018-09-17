//
//  VehVendorAvail.h
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "Vendor.h"
#import "VehAvail.h"

NS_ASSUME_NONNULL_BEGIN

@protocol VehVendorAvail;

@interface VehVendorAvail : JSONModel

@property (nonatomic,strong) Vendor* vendor;
@property (nonatomic,strong) NSArray<VehAvail> *vehAvails;

@end

NS_ASSUME_NONNULL_END
