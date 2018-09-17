//
//  VehicleDataInteractor.m
//  CarTrawlerDemo
//
//  Created by lei on 15/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "VehicleDataInteractor.h"

@implementation VehicleDataInteractor

#pragma mark - VehicleListInteractorProtocolInput
- (void)retrieveData {
    
    Booking *booking = [self.localDataManagerProtocol retrieveCarBookingLocal];
    NSArray<VehicleVendor*> *vehicleVendors = [self.localDataManagerProtocol retrieveCarListLocal];
    
    if (booking && vehicleVendors) {
        [self.presenter vehicleListDataFetched:vehicleVendors andBooking:booking];
    }
    else{
        
        //retrieve data from remote server
        [self.remoteDataManagerProtocol retrieveCarsJsonData:^(VehAvailRSCore *vehAvailRSCore) {
            
            [self.localDataManagerProtocol saveDataLocal:vehAvailRSCore];
            
            Booking *booking = [self.localDataManagerProtocol retrieveCarBookingLocal];
            NSArray<VehicleVendor*> *vehicleVendors = [self.localDataManagerProtocol retrieveCarListLocal];
            
            [self.presenter vehicleListDataFetched:vehicleVendors andBooking:booking];
            
        } andErrorBlock:^(NSError *error) {
            [self.presenter onError:error];
        }];
    }
}

@end
