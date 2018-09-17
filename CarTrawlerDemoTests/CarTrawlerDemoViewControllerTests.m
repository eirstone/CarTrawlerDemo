//
//  CarTrawlerDemoViewControllerTests.m
//  CarTrawlerDemoTests
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "VehicleListPresenter.h"

#define MOCKITO_SHORTHAND
#import "OCMockito.h"

@interface CarTrawlerDemoViewControllerTests : XCTestCase

@property (nonatomic,strong) ViewController *view;
@property (nonatomic,strong) VehicleListPresenter *presenter;


@end

@implementation CarTrawlerDemoViewControllerTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.view = [[ViewController alloc] init];
    [self.view view];   // force the view to load
    
    self.presenter = mock(VehicleListPresenter.class);
    
    self.view.presenter = self.presenter;
}

- (void)testInitiViewStatus {
    // This is an example of a functional test case.
    
    XCTAssert(self.view.tableView.numberOfSections == 0);
    XCTAssert(self.view.sorting == DEFAULT);
}

- (void)testRequestUpdateAtViewDidLoad{
    
    [self.view viewDidLoad];
    [verify(self.presenter) updateView];
}

- (void)testSortingBaggagedQuantityButtonClicked{
    
    [self.view sortingBaggageQuantityButtonClicked:mock(UIBarButtonItem.class)];
    XCTAssert(self.view.sorting == BAGGAGE_QUANTITY);
}

- (void)testSortingGroupButtonClicked{
    
    [self.view sortingGroupButtonClicked:mock(UIBarButtonItem.class)];
    XCTAssert(self.view.sorting == GROUP);
}

- (void)testSortingDefaultButtonClicked{
    
    [self.view sortingDefaultButtonClicked:mock(UIBarButtonItem.class)];
    XCTAssert(self.view.sorting == DEFAULT);
}

@end
