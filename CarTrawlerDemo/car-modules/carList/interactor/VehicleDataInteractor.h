//
//  VehicleDataInteractor.h
//  CarTrawlerDemo
//
//  Created by lei on 15/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VehicleListViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VehicleDataInteractor : NSObject  <VehicleListInteractorProtocolInput>

@property (nonatomic) id<VehAvailRSCoreLocalDataManagerProtocol> localDataManagerProtocol;
@property (nonatomic) id<VehAvailRSCoreRemoteDataManagerProtocol> remoteDataManagerProtocol;
@property (nonatomic,weak) id<VehicleListInteractorProtocolOutput> presenter;

@end

NS_ASSUME_NONNULL_END
