//
//  VehicleListPresenter.h
//  CarTrawlerDemo
//
//  Created by lei on 15/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VehicleListViewProtocol.h"
#import "VehicleListWireframe.h"

NS_ASSUME_NONNULL_BEGIN

@interface VehicleListPresenter : NSObject <VehicleListPresenterProtocol,VehicleListInteractorProtocolOutput>

@property (nonatomic, strong) NSArray<VehicleVendor*> *vehicleVendors;
@property (nonatomic, strong) Booking *booking;

// Reference to the View (weak to avoid retain cycle).
@property (nonatomic,weak) id<VehicleListViewProtocol> view;

@property (nonatomic) id<VehicleListInteractorProtocolInput> interactor;
@property (nonatomic) id<VehicleListWireframeProtocol> wireframe;

@property (nonatomic, strong) NSDictionary<NSString*,NSData*> *imagesCache;

@end

NS_ASSUME_NONNULL_END
