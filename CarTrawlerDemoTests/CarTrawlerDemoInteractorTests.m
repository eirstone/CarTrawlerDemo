//
//  CarTrawlerDemoInteractorTests.m
//  CarTrawlerDemoTests
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "VehicleDataInteractor.h"
#import "GetVehAvailRSCoreRemoteDataManager.h"
#import "GetVehAvailRSCoreLocalDataManager.h"
#import <XCTest/XCTest.h>

@interface CarTrawlerDemoInteractorTests : XCTestCase <VehicleListInteractorProtocolOutput>

@property (nonatomic, strong) VehicleDataInteractor *interactor;

@end

@implementation CarTrawlerDemoInteractorTests

- (void)setUp {

    GetVehAvailRSCoreLocalDataManager *localMgr = [[GetVehAvailRSCoreLocalDataManager alloc] init];
    GetVehAvailRSCoreRemoteDataManager *remoteMgr = [[GetVehAvailRSCoreRemoteDataManager alloc] init];

    // Put setup code here. This method is called before the invocation of each test method in the class.
    VehicleDataInteractor *interactor = [[VehicleDataInteractor alloc] init];
    interactor.presenter = self;
    interactor.remoteDataManagerProtocol = remoteMgr;
    interactor.localDataManagerProtocol = localMgr;
    
    self.interactor = interactor;
}

- (void)testRetrieveData {
    
    [self.interactor retrieveData];
}


#pragma mark - VehicleListInteractorProtocolOutput
- (void)vehicleListDataFetched:(NSArray<VehicleVendor*> *)vehicleVendors andBooking:(Booking*)booking{
    XCTAssertNotNil(vehicleVendors);
    XCTAssertNotNil(booking);
    
    XCTAssert(vehicleVendors.count > 0);
    for (VehicleVendor *vehicleVendor in vehicleVendors) {
        
        NSArray<Vehicle*> *vehicles = [vehicleVendor.vehicle allObjects];
        XCTAssert(vehicles.count > 0);
    }
}

- (void)onError:(NSError*)error{
    XCTAssert(error == nil);
}

@end
