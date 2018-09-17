//
//  CarTrawlerDemoPresenterTests.m
//  CarTrawlerDemoTests
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VehicleListPresenter.h"

#define MOCKITO_SHORTHAND
#import "OCMockito.h"

@interface CarTrawlerDemoPresenterTests : XCTestCase

@property (nonatomic,strong) VehicleListPresenter *presenter;
@property (nonatomic,strong) id<VehicleListViewProtocol> view;
@property (nonatomic,strong) id<VehicleListInteractorProtocolInput> interactor;

@end

@implementation CarTrawlerDemoPresenterTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.presenter = [[VehicleListPresenter alloc] init];
    
    self.view = mockProtocol(@protocol(VehicleListViewProtocol));
    self.interactor = mockProtocol(@protocol(VehicleListInteractorProtocolInput));
    
    self.presenter.view = self.view;
    self.presenter.interactor = self.interactor;
}

- (void)testUpdateView {
    // This is an example of a functional test case.
    [self.presenter updateView];
    
    [verify(self.view) showLoading];
    [verify(self.interactor) retrieveData];
}

- (void)testDataFetched{
    
    [self.presenter vehicleListDataFetched:mock(NSArray.class) andBooking:mock(Booking.class)];
    
    [verify(self.view) hideLoading];
    [verify(self.view) showVehicleData];
}


@end
