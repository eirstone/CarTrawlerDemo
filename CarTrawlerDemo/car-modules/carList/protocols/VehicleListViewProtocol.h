//
//  VehicleListViewProtocol.h
//  CarTrawlerDemo
//
//  Created by lei on 15/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VehAvailRSCore.h"
#import "VehRentalCore.h"
#import "VehicleVendor+CoreDataClass.h"
#import "Vehicle+CoreDataClass.h"
#import "Booking+CoreDataClass.h"

typedef NS_ENUM (NSInteger,SORTING){
    DEFAULT,
    BAGGAGE_QUANTITY,
    GROUP
};
typedef void (^ImageDownloadedCompletion)(UIImage* vehicleImage);

NS_ASSUME_NONNULL_BEGIN

@protocol VehicleListViewProtocol <NSObject>

- (void)showVehicleData;
- (void)showError:(NSError*)error;
- (void)showLoading;
- (void)hideLoading;
- (void)imageData:(NSData*)imageData andIndexPath:(NSIndexPath*)indexpath;

@end


@protocol VehicleListPresenterProtocol <NSObject>

- (void)updateView;
- (NSString*)getBookingInformation;
- (NSArray<Vehicle*>*)getDefaultVehiclesList;
- (NSArray<Vehicle*>*)getVehiclesListByBaggageQuantity;
- (NSInteger)totalVehicles;
- (NSInteger)totalVendors;
- (NSInteger)numberOfRowsInSectionForGroupedOption:(NSInteger)section;
- (NSString*)getVehicleGroupSectionTitle:(NSInteger)groupSection;
- (NSDictionary*)getVehicleText:(SORTING)sorting atIndexPath:(NSIndexPath*)indexPath;
- (void)imageData:(NSData*)imageData andIndexPath:(NSIndexPath*)indexpath;
- (void)showDetailsForVehicle:(NSIndexPath*)indexPath sorting:(SORTING)sorting fromCurrentVehicleListView:(UIViewController*)viewController;

@end


@protocol VehicleListInteractorProtocolInput <NSObject>

- (void)retrieveData;

@end

@protocol VehicleListInteractorProtocolOutput <NSObject>

- (void)vehicleListDataFetched:(NSArray<VehicleVendor*> *)vehicleVendors andBooking:(Booking*)booking;
- (void)onError:(NSError*)error;

@end

#pragma mark - get vehicle data from server
typedef void (^ErrorBlock)(NSError *error);
typedef void (^CompletionBlockString)(VehAvailRSCore *vehAvailRSCore);

@protocol VehAvailRSCoreRemoteDataManagerProtocol <NSObject>

- (void)retrieveCarsJsonData:(CompletionBlockString)completionBlock andErrorBlock:(ErrorBlock)errorBlock;

@end

#pragma mark - get vehicle data from local coredata
@protocol VehAvailRSCoreLocalDataManagerProtocol <NSObject>

- (NSArray<VehicleVendor*>*)retrieveCarListLocal;
- (Booking*)retrieveCarBookingLocal;

- (void)saveDataLocal:(nonnull VehAvailRSCore *)vehAvailRSCore;
@end

NS_ASSUME_NONNULL_END
