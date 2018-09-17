//
//  GetVehAvailRSCoreLocalDataManager.m
//  CarTrawlerDemo
//
//  Created by lei on 15/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "GetVehAvailRSCoreLocalDataManager.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
//#import "Vehicle+CoreDataClass.h"
#import "CoreDataManager.h"

@implementation GetVehAvailRSCoreLocalDataManager

#pragma mark - Get Managed Context
- (NSManagedObjectContext*)getManagedContext{

    return [[CoreDataManager sharedManager] managedObjectContext];
}


#pragma mark - VehAvailRSCoreLocalDataManagerInputProtocol

- (Booking *)retrieveCarBookingLocal {
    
    NSManagedObjectContext *managedContext = [self getManagedContext];
    
    NSFetchRequest<Booking *> *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:Booking.description inManagedObjectContext:managedContext]];
    
    NSError *error = nil;
    NSArray *results = [managedContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"%@, %@", error, error.localizedDescription);
        return nil;
    }
    
    if (results.count > 0) {
        return results[0];
    }
    else{
        return nil;
    }
}

- (nonnull NSArray<VehicleVendor *> *)retrieveCarListLocal {

    NSManagedObjectContext *managedContext = [self getManagedContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:VehicleVendor.description inManagedObjectContext:managedContext]];
    
    NSError *error = nil;
    NSArray *results = [managedContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"%@, %@", error, error.localizedDescription);
        return nil;
    }
    else{
        return results;
    }
}

- (void)saveDataLocal:(nonnull VehAvailRSCore *)vehAvailRSCore{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    //2014-09-22T10:00:00Z
    
    NSManagedObjectContext *managedContext = [self getManagedContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:Booking.description inManagedObjectContext:managedContext];
    
    NSDate *pickupDate = [formatter dateFromString:vehAvailRSCore.vehRentalCore.pickUpDateTime];
    NSDate *returnDate = [formatter dateFromString:vehAvailRSCore.vehRentalCore.returnDateTime];
    
    Booking *booking = [[Booking alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:managedContext];
    
    booking.pickUpLocation = vehAvailRSCore.vehRentalCore.pickupLocation.name;
    booking.returnLocation = vehAvailRSCore.vehRentalCore.returnLocation.name;
    booking.pickUpDateTime = pickupDate;
    booking.returnDateTime = returnDate;
    
    NSEntityDescription *vehVendorAvailDescription = [NSEntityDescription entityForName:VehicleVendor.description inManagedObjectContext:managedContext];

    NSEntityDescription *vehicleDescription = [NSEntityDescription entityForName:Vehicle.description inManagedObjectContext:managedContext];


    for (VehVendorAvail *vehVendor in vehAvailRSCore.vehVendorAvails) {

        //save vehicleVendor
        VehicleVendor *vehicleVendor = [[VehicleVendor alloc] initWithEntity:vehVendorAvailDescription insertIntoManagedObjectContext:managedContext];

        vehicleVendor.vendorCode = vehVendor.vendor.code;
        vehicleVendor.vendorName = vehVendor.vendor.name;

        for (VehAvail *vehAvail in vehVendor.vehAvails) {

            Vehicle *vehicle = [[Vehicle alloc] initWithEntity:vehicleDescription insertIntoManagedObjectContext:managedContext];

            vehicle.status = vehAvail.status;
            vehicle.doorCount = vehAvail.vehicle.doorCount.intValue;
            vehicle.baggageQuantity = vehAvail.vehicle.baggageQuantity.intValue;
            vehicle.vehMakeModel = vehAvail.vehicle.vehMakeModel.name;
            vehicle.transmissionType = vehAvail.vehicle.transmissionType;
            vehicle.rateTotalAmount = vehAvail.totalCharge.rateTotalAmount;
            vehicle.pictureURL = vehAvail.vehicle.pictureURL;
            vehicle.passengerQuantity = vehAvail.vehicle.passengerQuantity;
            vehicle.fuelType = vehAvail.vehicle.fuelType;
            vehicle.estimatedTotalAmount = vehAvail.totalCharge.estimatedTotalAmount;
            vehicle.driveType = vehAvail.vehicle.driveType;
            vehicle.currencyCode = vehAvail.totalCharge.currencyCode;
            vehicle.codeContext = vehAvail.vehicle.codeContext;
            vehicle.code = vehAvail.vehicle.code;

            if ([vehAvail.vehicle.airConditionInd isEqualToString:@"true"]) {
                vehicle.airConditionInd = true;
            }
            else{
                vehicle.airConditionInd = false;
            }

            [vehicleVendor addVehicleObject:vehicle];
        }
    }

    NSError *error = nil;
    if (![managedContext save:&error]) {
        NSLog(@"Vehicles save failed, due to %@ %@", error, [error localizedDescription]);
    }
}

@end
